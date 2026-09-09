//===================== Imports =====================//

use rand::{
    Rng,
    rngs::SmallRng
};

use crate::{
    PI,
    model::{
        parameters::Parameters, 
        potential_types::PotentialType
    }
};

//===================== Function =====================//

/// ### Description
/// 
/// Fills the parameter vector depending on the model
/// 
/// ### Parameters
/// 
/// * `parameter_vector: &mut Vec<Parameters>` - The parameter vector
/// * `parameters_rng: &mut SmallRng` - The SmallRng
/// * `parameters_per_batch: usize` - The number of parameters per batch
/// * `parameters_limits: &[[f64; 2]; 8]` - The limits of the parameters
/// * `potential_type: PotentialType` - The potential type
pub fn fill_parameter_vector(
    parameter_vector: &mut Vec<Parameters>,
    parameters_rng: &mut SmallRng,
    parameters_per_batch: usize,
    parameters_limits: &[[f64; 2]; 8],
    potential_type: PotentialType
) {
    match potential_type {
        PotentialType::Z2Violating2HDM => {
            for _ in 0..parameters_per_batch {
                parameter_vector.push(
                    Parameters::new(
                        parameters_rng.random_range(parameters_limits[0][0]..=parameters_limits[0][1]),
                        parameters_rng.random_range(parameters_limits[1][0]..=parameters_limits[1][1]),
                        parameters_rng.random_range(parameters_limits[2][0]..=parameters_limits[2][1]),
                        parameters_rng.random_range(parameters_limits[3][0]..=parameters_limits[3][1]),
                        parameters_rng.random_range(parameters_limits[4][0]..=parameters_limits[4][1]),
                        parameters_rng.random_range(parameters_limits[5][0]..=parameters_limits[5][1]),
                        parameters_rng.random_range(parameters_limits[6][0]..=parameters_limits[6][1]),
                        parameters_rng.random_range(parameters_limits[7][0]..=parameters_limits[7][1]),
                    )
                );
            }
        },
        PotentialType::Z2Conserving2HDM => {
            for _ in 0..parameters_per_batch {
                parameter_vector.push(
                    Parameters::new(
                        parameters_rng.random_range(parameters_limits[0][0]..=parameters_limits[0][1]),
                        parameters_rng.random_range(parameters_limits[1][0]..=parameters_limits[1][1]),
                        parameters_rng.random_range(parameters_limits[2][0]..=parameters_limits[2][1]),
                        parameters_rng.random_range(parameters_limits[3][0]..=parameters_limits[3][1]),
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                    )
                );
            }
        },
        PotentialType::Z2Violating2HDMSymmetric => {
            for _ in 0..parameters_per_batch {

                // In this subcase, rho_6 = rho_7 and alpha_6 = alpha_7
                let rho_6: f64 = parameters_rng.random_range(parameters_limits[4][0]..=parameters_limits[4][1]);
                let alpha_6: f64 = parameters_rng.random_range(parameters_limits[5][0]..=parameters_limits[5][1]);

                parameter_vector.push(
                    Parameters::new(
                        parameters_rng.random_range(parameters_limits[0][0]..=parameters_limits[0][1]),
                        parameters_rng.random_range(parameters_limits[1][0]..=parameters_limits[1][1]),
                        parameters_rng.random_range(parameters_limits[2][0]..=parameters_limits[2][1]),
                        parameters_rng.random_range(parameters_limits[3][0]..=parameters_limits[3][1]),
                        rho_6,
                        alpha_6,
                        rho_6,
                        alpha_6,
                    )
                );
            }
        },
        PotentialType::Z2Violating2HDMAntisymmetric => {
            for _ in 0..parameters_per_batch {

                // In this subcase, rho_6 = rho_7 and alpha_7 = alpha_6 + π
                // Note that alpha_6 limits have been changed in order to visualize the results better (given the π shift in alpha_7),
                // however, this does not change anything since the potential is periodic in alpha
                let rho_6: f64 = parameters_rng.random_range(parameters_limits[4][0]..=parameters_limits[4][1]);
                let alpha_6: f64 = parameters_rng.random_range(-PI..=2.0 * PI);

                parameter_vector.push(
                    Parameters::new(
                        parameters_rng.random_range(parameters_limits[0][0]..=parameters_limits[0][1]),
                        parameters_rng.random_range(parameters_limits[1][0]..=parameters_limits[1][1]),
                        parameters_rng.random_range(parameters_limits[2][0]..=parameters_limits[2][1]),
                        parameters_rng.random_range(parameters_limits[3][0]..=parameters_limits[3][1]),
                        rho_6,
                        alpha_6,
                        rho_6,
                        alpha_6 + PI,
                    )
                );
            }
        }
    }
}