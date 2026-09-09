//===================== Imports =====================//

use std::fs::OpenOptions;
use std::io::{
    self,
    Write
};

use crate::model::{
    parameters::Parameters,
    variables::Variables
};

//===================== Function =====================//

/// ### Description
/// 
/// Save results into text file
/// 
/// ### Parameters
/// 
/// * `parameter_list: &Vec<&Parameters>` - The valid parameters
/// * `bests_list: &Vec<&Variables>` - The best variables
/// * `filenames: [&str; 2]` - The file names where tha data is stored
/// 
/// ### Returns
/// 
/// * `io::Result<()>` - `OK` if the text file was generated correctly, `Error` otherwise.
pub fn save_results_to_txt(
    parameter_list: &Vec<&Parameters>,
    bests_list: &Vec<&Variables>,
    filenames: [&str; 2]
) -> io::Result<()> {
    
    /* Create the files */
    
    let mut parameters_file = OpenOptions::new()
        .create(true)
        .append(true)
        .open(filenames[0])?;

    let mut bests_file = OpenOptions::new()
        .create(true)
        .append(true)
        .open(filenames[1])?;

    /* Save the data in text files */

    for parameter in parameter_list {
        writeln!(
            parameters_file,
            "{},{},{},{},{},{},{},{}",
            parameter.rho_3,
            parameter.rho_4,
            parameter.rho_5,
            parameter.alpha_5,
            parameter.rho_6,
            parameter.alpha_6,
            parameter.rho_7,
            parameter.alpha_7
        )?;
    }

    for best in bests_list {
        writeln!(
            bests_file,
            "{},{},{}",
            best.r,
            best.phi,
            best.chi
        )?;
    }

    Ok(())
}