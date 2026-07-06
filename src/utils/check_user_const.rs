use crate::model::potential_types::PotentialType;

/// ### Description
/// 
/// Checks user inputs
/// 
/// ### Parameters
/// 
/// * `population_number: &usize` - The population number
/// * `crossover_probability: &f64` - The crossover probability
/// * `scaling_factor: &f64` - The scaling factor
/// * `number_of_parameter_vectors: &usize` - The number of trial vectors
/// * `batch_number: &usize` - The number of batches
/// * `max_iter: &usize` - The maximum number of iterations
/// * `min_iter: &usize` - The minumum number of iterations
/// * `epsilon: &f64` - The tolerance of the algorithm
/// * `parameters_border: &f64` - The maximum value of the parameters
/// * `parameters_file_name: &str` - The file that contains valid parameter
/// * `best_vectors_file_name: &str` - The file that contains bests vectors
/// * `variable_limits: &[[f64; 2]; 3]` - The limits to the variables r, phi and chi
/// * `potential_types: &PotentialType` - The limits to the parameters of the potential
pub fn check_const(
    population_number: &usize,
    crossover_probability: &f64,
    scaling_factor: &f64,
    number_of_parameter_vectors: &usize,
    batch_number: &usize,
    max_iter: &usize,
    min_iter: &usize,
    epsilon: &f64,
    parameters_border: &f64,
    parameters_file_name: &str,
    best_vectors_file_name: &str,
    variable_limits: &[[f64; 2]; 3],
    potential_types: &PotentialType
) {
    /* Min value */
    let min_value: f64 = 0.0;

    /* Max value */
    let max_value: f64 = 1.0;

    /* Number π */
    let pi: f64 = std::f64::consts::PI;

    // Check that population number is positive
    assert!(
        population_number > &(min_value as usize),
        "POPULATION_NUMBER must be positive"
    );

    // Check that the number of parameter vectors is positive
    assert!(
        number_of_parameter_vectors > &(min_value as usize),
        "NUMBER_OF_PARAMETER_VECTORS must be positive"
    );

    // Check that the batch number is positive
    assert!(
        batch_number > &(min_value as usize),
        "BATCH_NUMBER must be positive"
    );

    // Check that the number of parameter vectors is divisible by the batch number
    assert!(
        number_of_parameter_vectors % batch_number == 0,
        "{} must be divisible by {}.",
        number_of_parameter_vectors,
        batch_number
    );

    // Check that crossover probability is within the range [0,1]
    assert!(
        crossover_probability >= &min_value 
        && crossover_probability <= &max_value,
        "The CROSSOVER_PROBABILITY must be between 0 and 1"
    );

    // Check that scaling factor is positive
    assert!(
        scaling_factor > &min_value,
        "The SCALING_FACTOR must be positive"
    );

    // Check that the maximum number of iterations is greater than the minumum number of iterations
    assert!(
        min_iter < max_iter,
        "MIN_ITER cannot be greater than MAX_ITER"
    );

    // Check that maximum number of iterations is positive
    assert!(
        max_iter > &(min_value as usize),
        "MAX_ITER must be positive"
    );

    // Check that minumum number of iterations is greater than 2
    assert!(
        min_iter > &(2 as usize),
        "MIN_ITER must be greater than 2"
    );

    // Check that the tolerance is positive
    assert!(
        epsilon > &min_value,
        "EPSILON must be positive"
    );

    // Check that the parameters maximum value is positive
    assert!(
        parameters_border > &min_value,
        "The PARAMETERS_BORDER must be positive"
    );

    // Check that the file contains a file extension
    assert!(
        parameters_file_name.contains("."),
        "The parameter file extension needs to be provided"
    );

    // Check that the file contains a file extension
    assert!(
        best_vectors_file_name.contains("."),
        "The best vector file extension needs to be provided"
    );

    // Check that variable limits were not modified
    assert!(
        variable_limits[0][0] == min_value
        && variable_limits[1][0] == min_value
        && variable_limits[2][0] == min_value
        && variable_limits[0][1] == max_value
        && variable_limits[1][1] == 4.0 * pi
        && variable_limits[2][1] == pi / 2.0,
        "VARIABLE_LIMITS cannot be changed since they are mathematically obtained"
    );

    // Warning
    if potential_types != &PotentialType::Z2Violating2HDM {
        println!(
            "WARNING: Although this code admits other potential types besides PotentialType::Z2Violating2HDM,
            it has been used always for this case (the most general case). Other potential types are computed
            as a subcase of the most general potential. As a consequence, some calculations and/or parameters
            can be unnecessary, which can lead to inefficiencies."
        );
    }
}