//========================================================================//
//  This code implements a variant of a differential evolution algorithm  //
//  known as best/1/bin. This algorithm employees mutation and crossover  //
//  (randomly) in each iteration in order to improve the population of    //
//  candidate solutions.                                                  //
//========================================================================//



//===================== Import structs and functions =====================//

mod model;
mod utils;

use crate::model::{
    parameters::Parameters,
    variables::Variables,
    potential_types::PotentialType
};

use crate::utils::{
    higgs_potential::potential_calc,
    check_user_const::check_const,
    save_results::save_results_to_txt,
    fill_parameter_vector::fill_parameter_vector,
    squared_distance::squared_distance_has_converged
};

use rand::{
    Rng,
    SeedableRng,
    rngs::SmallRng
};

use std::sync::atomic::{
    AtomicI64,
    Ordering
};

use rayon::prelude::*;

//============================ General values ============================//

/* Number π */
pub const PI: f64 = std::f64::consts::PI;

/* The tolerance of the algorithm */
pub const EPSILON: f64 = 1.0E-7;

/* The population number */
const POPULATION_NUMBER: usize = 100;

/* The crossover probability */
const CROSSOVER_PROBABILITY: f64 = 0.9;

/* The scaling factor */
const SCALING_FACTOR: f64 = 0.9;

/* The number of trial vectors */
const NUMBER_OF_PARAMETERS_VECTORS: usize = 100_000_000;

/* The number of batches */
const BATCH_NUMBER: usize = 2500;

/* The maximum number of iterations */
const MAX_ITER: usize = 100; 

/* The minimum number of iterations */
const MIN_ITER: usize = 5;

/* The maximum value of the parameters */
/* It is advisable to choose a border that is bigger than the region to be plotted */
const PARAMETERS_BORDER: f64 = 80.0;

/* The file that contains valid parameters */
const PARAMETERS_FILE_NAME: &str = "Z2_violating_parameters.txt";

/* The file that contains bests vectors */
const BEST_VECTOR_FILE_NAME: &str = "Z2_violating_bests.txt";

/* Apply a minimization check */
/* Sometimes, the convengence criteria used does not find the exact absolute minimum in certain cases */
const APPLY_MINIMIZATION_CHECK: bool = true;

/* The model that is going to be studied */
/* Possible types: Z2Conserving2HDM, Z2Violating2HDMSymmetric, Z2Violating2HDMAntisymmetric, Z2Violating2HDM */
const POTENTIAL_TYPE: PotentialType = PotentialType::Z2Violating2HDM;

/* The limits to the variables r, phi and chi */
/* These limits should not be modified, since they cover all the avaliable region */
const VARIABLE_LIMITS: [[f64; 2]; 3] = [
    [0.0, 1.0],                                // r --> idx = 0
    [0.0, 4.0 * PI],                           // phi --> idx = 1
    [0.0, PI / 2.0]                            // chi --> idx = 2
];

/* The limits to the parameters of the potential */
/* These limits can be changed as desired. In order to avoid  */
const PARAMETER_LIMITS: [[f64; 2]; 8] = [
    [-PARAMETERS_BORDER, PARAMETERS_BORDER],   // rho_3 --> idx = 0
    [-PARAMETERS_BORDER, PARAMETERS_BORDER],   // rho_4 --> idx = 1
    [0.0, PARAMETERS_BORDER],                  // rho_5 --> idx = 2
    [0.0, 2.0 * PI],                           // alpha_5 --> idx = 3
    [0.0, PARAMETERS_BORDER],                  // rho_6 --> idx = 4
    [0.0, 2.0 * PI],                           // alpha_6 --> idx = 5
    [0.0, PARAMETERS_BORDER],                  // rho_7 --> idx = 6
    [0.0, 2.0 * PI]                            // alpha_7 --> idx = 7
];

//================================= Main =================================//

/// # Main function
fn main() {

    // Check inputs before proceeding
    check_const(
        &POPULATION_NUMBER,
        &CROSSOVER_PROBABILITY,
        &SCALING_FACTOR,
        &NUMBER_OF_PARAMETERS_VECTORS,
        &BATCH_NUMBER,
        &MAX_ITER,
        &MIN_ITER,
        &EPSILON,
        &PARAMETERS_BORDER,
        &PARAMETERS_FILE_NAME,
        &BEST_VECTOR_FILE_NAME,
        &VARIABLE_LIMITS,
        &POTENTIAL_TYPE
    );

    // Adjust the number of parameters per batch
    let parameters_per_batch: usize = NUMBER_OF_PARAMETERS_VECTORS / BATCH_NUMBER;

    // Initialize the parameter vector
    let mut parameter_vector: Vec<Parameters> = Vec::with_capacity(parameters_per_batch);

    // Proceed with the computation (in batches)
    for batch in 1..=BATCH_NUMBER {

        // Count how many times the algorithm reaches MAX_ITER
        // or the algorithm coverges befores reaching MIN_ITER
        let number_max_iterations: AtomicI64 = AtomicI64::new(0);
        let number_min_iterations: AtomicI64 = AtomicI64::new(0);
        
        // Create parameters_rng
        let mut parameters_rng: SmallRng = SmallRng::seed_from_u64(
            /* The seed that generates random numbers for parameters */
            rand::random::<u64>()
        );

        // Fill the parameter vector
        fill_parameter_vector(
            &mut parameter_vector,
            &mut parameters_rng,
            parameters_per_batch,
            &PARAMETER_LIMITS,
            POTENTIAL_TYPE
        );

        // Apply algorithm for each vector
        let bests_unchecked: Vec<(Variables, bool)> = parameter_vector
            .par_iter()
            .map(|parameters| {
                let (result, iterations) = best1bin_algorithm(parameters);

                // If the algorithm does not converge for certain parameters,
                // do not save the results.
                let mut save: bool = true;
                if MAX_ITER == iterations {
                    number_max_iterations.fetch_add(1, Ordering::Relaxed);
                    save = false;
                } else if MIN_ITER == iterations {
                    number_min_iterations.fetch_add(1, Ordering::Relaxed);
                    save = false;
                }

                (result, save)
            })
            .collect();

        // Apply minimization check if necessary
        let bests_checked: Vec<(Variables, bool)>;

        if POTENTIAL_TYPE == PotentialType::Z2Violating2HDMSymmetric && APPLY_MINIMIZATION_CHECK {
            bests_checked = bests_unchecked
                .iter()
                .zip(parameter_vector.iter())
                .map(|(tuple, parameter)| {
                    // If the algorithm converged
                    if tuple.1 { 
                        let variable: Variables = tuple.0.clone();
                        let u: f64 = parameter.rho_6 * variable.r * (parameter.alpha_6 + 0.5 * variable.phi).cos() + parameter.rho_7 * variable.r * (parameter.alpha_7 + 0.5 * variable.phi).cos();

                        if u > 0.0 {
                            // Discard if phi is 0 or 4π (borders)
                            if (variable.phi - 4.0 * PI).abs() < EPSILON || variable.phi.abs() < EPSILON {
                                return (variable, false);
                            }

                            let auxiliar_variable: Variables = Variables {
                                r: variable.r,
                                phi: (variable.phi + 2.0 * PI).rem_euclid(4.0 * PI), // (phi + 2π) mod 4π
                                chi: variable.chi
                            };

                            let old_potential: f64 = potential_calc(parameter, &variable);

                            let new_potential: f64 = potential_calc(parameter, &auxiliar_variable);
                            
                            // In case u > 0, it is always possible to shift phi --> phi + 2π and
                            // obtain the value -u, which can lead to a lower value
                            // of the potential that the best1bin algorithm could not found.
                            if new_potential < old_potential {
                                return (auxiliar_variable, true);
                            }
                        }
                    }

                    // Do not change anything if the
                    // algorithm did not converge or if u < 0
                    tuple.clone()
                })
                .collect()
        } else {
            bests_checked = bests_unchecked;
        }

        let number_max: i64 = number_max_iterations.load(Ordering::Relaxed);
        let number_min: i64 = number_min_iterations.load(Ordering::Relaxed);
        println!("Saving results... (Batch {}/{}). Number of times MAX_ITER was reached (the algorithm might not be converging) --> {}/{}. Number of times last iteration was MIN_ITER (the algorithm converges early) --> {}/{}.",
            batch,
            BATCH_NUMBER,
            number_max,
            parameters_per_batch,
            number_min,
            parameters_per_batch
        );

        // Initialize the result vector
        let mut parameter_results: Vec<&Parameters> = Vec::new();
        let mut best_vector_results: Vec<&Variables> = Vec::new();

        // Fill the result vector only if they are valid: 
        // - The minimum value of the potential, given by bests[idx], is greater than zero
        // - The results have save = true
        // - The second round corroborates that the same result is obtained
        for idx in 0..parameters_per_batch {
            if bests_checked[idx].1 && potential_calc(&parameter_vector[idx], &bests_checked[idx].0) > 0.0 {

                let (second_round_bests, second_round_iterations) = best1bin_algorithm(&parameter_vector[idx]);

                if Variables::equals(&second_round_bests, &bests_checked[idx].0) && second_round_iterations < MAX_ITER && second_round_iterations > MIN_ITER {
                    parameter_results.push(
                        &parameter_vector[idx]
                    );
                    best_vector_results.push(
                        &bests_checked[idx].0
                    );
                }
            }
        }

        // Save the results in text files
        match save_results_to_txt(&parameter_results, &best_vector_results, [PARAMETERS_FILE_NAME, BEST_VECTOR_FILE_NAME]) {
            Err(_) => println!("Unable to create the specified files: {} and/or {}", PARAMETERS_FILE_NAME, BEST_VECTOR_FILE_NAME),
            _ => ()
        }

        // Clear the parameter_vector for next batch
        parameter_vector.clear();
    }
}

/// ### Description
/// 
/// This function implements the DE/best/1/bin algorithm
/// 
/// ### Function parameters
/// 
/// * `param: &Parameters` - The set of parameters of the potential
/// 
/// ### Returns
/// 
/// * `(Variables, usize)` - The best individual and the number of iterations
fn best1bin_algorithm(
    param: &Parameters
) -> (Variables, usize) {

    // Create population_rng
    let mut population_rng: SmallRng = SmallRng::seed_from_u64(
        /* The seed that generates random numbers for population */
        rand::random::<u64>()
    );

    // Create binomial_rng
    let mut binomial_rng: SmallRng = SmallRng::seed_from_u64(
        /* The seed that generates a binomial distribution */
        rand::random::<u64>()
    );

    // Create random_idx_range
    let mut random_idx_rng: SmallRng = SmallRng::seed_from_u64(
        /* The seed that generates a random index (idx) */
        rand::random::<u64>()
    );

    // Initialize iteration counter
    let mut iter: usize = 0;

    // Initialize potential
    let mut potential: Vec<f64> = vec![f64::default(); POPULATION_NUMBER];

    // Initialize trial potential
    let mut trial_potential: Vec<f64> = vec![f64::default(); POPULATION_NUMBER];

    // Initialize best individual
    let mut best_individual: Variables = Variables::default();

    // Initialize population
    let mut population: Vec<Variables> = vec![Variables::default(); POPULATION_NUMBER];

    // Initialize mutant population
    let mut mutant_population: Vec<Variables> = vec![Variables::default(); POPULATION_NUMBER];

    // Initialize trial population
    let mut trial_population: Vec<Variables> = vec![Variables::default(); POPULATION_NUMBER];

    // Initialize as false the variable that controls if the distance is greater than a given tolerance (EPSILON)
    let mut has_converged: bool = false;

    // Fill population
    for idx in 0..POPULATION_NUMBER {
        population[idx] = Variables::new(
            population_rng.random_range(VARIABLE_LIMITS[0][0]..=VARIABLE_LIMITS[0][1]),
            population_rng.random_range(VARIABLE_LIMITS[1][0]..=VARIABLE_LIMITS[1][1]),
            population_rng.random_range(VARIABLE_LIMITS[2][0]..=VARIABLE_LIMITS[2][1])
        );
    }

    // Start iterating over algorithm epochs
    while iter < MAX_ITER && (!has_converged || iter < MIN_ITER) {

        // Initialize the best individual index
        let mut best_individual_idx: usize = 0;

        // Search for the index of the best individual
        for idx in 0..POPULATION_NUMBER { 

            potential[idx] = potential_calc(
                param,
                &population[idx]
            );

            if potential[idx] < potential[best_individual_idx] {
                best_individual_idx = idx;
            }
        }

        // Get best individual by using its index
        best_individual = population[best_individual_idx].clone();

        // This "for loop" cannot be merged with the "for loop" written
        // above since it is necessary to compute the whole potential (vector)
        // before. The best_individual_idx is also requiered beforehand.

        // Start mutating the population
        for idx in 0..POPULATION_NUMBER {

            // Get a random component of the Variable struct
            let rand_component: i32 = random_idx_rng.random_range(0..=2);

            // Get a random index of the population
            let mut rand1_idx: usize = random_idx_rng.random_range(0..POPULATION_NUMBER);

            // Get another random index of the population
            let mut rand2_idx: usize = random_idx_rng.random_range(0..POPULATION_NUMBER);

            // Ascertain all indexes are different
            while rand1_idx == rand2_idx || rand1_idx == best_individual_idx || rand2_idx == best_individual_idx || rand1_idx == idx || rand2_idx == idx {
                rand1_idx = random_idx_rng.random_range(0..POPULATION_NUMBER);
                rand2_idx = random_idx_rng.random_range(0..POPULATION_NUMBER);
            }

            // Get a random individual of the population by the first random index
            let first_random_individual: &Variables = &population[rand1_idx];

            // Get another random individual of the population by the second random index
            let second_random_individual: &Variables = &population[rand2_idx];

            // Create the mutated individual
            mutant_population[idx] = &best_individual + &(&(first_random_individual - second_random_individual) * SCALING_FACTOR); 

            // Mutation of the population
            for component in 0..=2 {

                let component_usize: usize = component as usize;
                let mutated_population: f64 = mutant_population[idx][component];

                // Verify that the mutated population exists within the variable limits
                if mutated_population < VARIABLE_LIMITS[component_usize][0] {

                    mutant_population[idx][component] = VARIABLE_LIMITS[component_usize][0];

                } else if mutated_population > VARIABLE_LIMITS[component_usize][1] {

                    mutant_population[idx][component] = VARIABLE_LIMITS[component_usize][1];
                }

                // Decide if mutate or not
                let use_mutant: bool = binomial_rng.random_range(0.0..1.0) < CROSSOVER_PROBABILITY || component == rand_component;

                trial_population[idx][component] = if use_mutant {

                    // Mutate
                    mutant_population[idx][component]

                } else {

                    // Do not mutate
                    population[idx][component]
                };
            }

            // Compute trial potential
            trial_potential[idx] = potential_calc(
                param,
                &trial_population[idx]
            );

            // Decide which is better
            if potential[idx] > trial_potential[idx] {

                // If the trial potential is better, substitute
                // the population individual with the trial one
                population[idx] = trial_population[idx].clone();
            }
        }

        // Evaluate if the difference bewteen best individual and the cache is greater than tolerance (EPSILON)
        has_converged = squared_distance_has_converged(&best_individual, &population, EPSILON);

        // Update iteration counter
        iter += 1;
    }

    // Return best individual
    (best_individual, iter)
}

