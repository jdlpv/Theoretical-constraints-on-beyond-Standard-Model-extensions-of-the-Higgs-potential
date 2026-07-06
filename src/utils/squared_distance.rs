//===================== Imports =====================//

use crate::model::variables::Variables;

//===================== Function =====================//

/// ### Description
/// 
/// This function checks if the euclidean distance between the best individual and
/// the rest of the individuals of the population is greater than a given tolerance
/// 
/// ### Parameters
/// 
/// * `best: &Variables` - The best individual
/// * `population: &Vec<Variables>` - The population
/// * `tolerance: f64` - The tolerance
/// 
/// ### Returns
/// 
/// * `bool` - True if all the distances are not greater than tolerance, false otherwise
pub fn squared_distance_has_converged(best: &Variables, population: &Vec<Variables>, tolerance: f64) -> bool {

    for variable in population {
        let r_diff: f64 = best.r - variable.r;
        let phi_diff: f64 = best.phi - variable.phi;
        let chi_diff: f64 = best.chi- variable.chi;

        if r_diff * r_diff + phi_diff * phi_diff + chi_diff * chi_diff > tolerance * tolerance {
            return false;
        }
    }

    return true;
}