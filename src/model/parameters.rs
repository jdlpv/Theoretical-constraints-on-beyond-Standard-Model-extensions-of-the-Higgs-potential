//===================== Imports =====================//

use std::ops::Index;

//===================== Struct =====================//

/// ### Description
/// 
/// The parameters of the potential
/// 
/// ### Parameters
/// 
/// * `pub rho_3: f64`
/// * `pub rho_4: f64`
/// * `pub rho_5: f64`
/// * `pub alpha_5: f64`
/// * `pub rho_6: f64`
/// * `pub alpha_6: f64`
/// * `pub rho_7: f64`
/// * `pub alpha_7: f64`
#[derive(Clone)]
pub struct Parameters {
    pub rho_3: f64,
    pub rho_4: f64,
    pub rho_5: f64,
    pub alpha_5: f64,
    pub rho_6: f64,
    pub alpha_6: f64,
    pub rho_7: f64,
    pub alpha_7: f64
}

//===================== Implementations =====================//

impl Parameters {

    /// ### Description
    /// 
    /// Creates a new Parameters struct
    /// 
    /// ### Function parameters
    /// 
    /// * `rho_3: f64`
    /// * `rho_4: f64`
    /// * `rho_5: f64`
    /// * `alpha_5: f64`
    /// * `rho_6: f64`
    /// * `alpha_6: f64`
    /// * `rho_7: f64`
    /// * `alpha_7: f64`
    /// 
    /// ### Returns
    /// 
    /// * `Self`
    pub fn new(
        rho_3: f64,
        rho_4: f64,
        rho_5: f64,
        alpha_5: f64,
        rho_6: f64,
        alpha_6: f64,
        rho_7: f64,
        alpha_7: f64,
    ) -> Self {
        Self {
            rho_3,
            rho_4,
            rho_5,
            alpha_5,
            rho_6,
            alpha_6,
            rho_7,
            alpha_7,
        }
    }
}

// Implementation necessary when accessing a struct by index
impl Index<i32> for Parameters {
    type Output = f64;

    fn index(&self, i: i32) -> &Self::Output {
        match i {
            0 => &self.rho_3,
            1 => &self.rho_4,
            2 => &self.rho_5,
            3 => &self.alpha_5,
            4 => &self.rho_6,
            5 => &self.alpha_6,
            6 => &self.rho_7,
            7 => &self.alpha_7,
            _ => panic!("Index out of bounds")
        }
    }
}