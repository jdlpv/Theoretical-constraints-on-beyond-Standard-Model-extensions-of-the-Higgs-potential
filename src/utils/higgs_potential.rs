//===================== Imports =====================//

use crate::model::{
    parameters::Parameters,
    variables::Variables
};

//===================== Function =====================//

/// ### Description
/// 
/// Computes the value of the potentital
/// 
/// ### Parameters
/// 
/// * `parameters: &Parameters` - The parameters
/// * `variables: &Variables` - The variables
/// 
/// ### Returns
/// 
/// * `f64` - The value of the potential
pub fn potential_calc (
    parameters: &Parameters,
    variables: &Variables
) -> f64 {

    // Pre-calculate rho_6 effective
    let rho_6_eff: f64 = parameters[4].abs() * variables[0] * (parameters[5] + 0.5 * variables[1]).cos();

    // Pre-calculate rho_7 effective
    let rho_7_eff: f64 = parameters[6].abs() * variables[0] * (parameters[7] + 0.5 * variables[1]).cos();

    // Pre-calculate sin(2 * chi)
    let sin_2chi: f64 = (2.0 * variables[2]).sin();

    // Return the value of the potential
    2.0 
    + (
        parameters[0] 
        + variables[0].powi(2) * (parameters[1] + parameters[2].abs() * (parameters[3] + variables[1]).cos())
        - 1.0
    ) * sin_2chi.powi(2)
    + (
        rho_6_eff
        + rho_7_eff
        + (2.0 * variables[2]).cos() * (rho_6_eff - rho_7_eff)
    ) * sin_2chi
}
