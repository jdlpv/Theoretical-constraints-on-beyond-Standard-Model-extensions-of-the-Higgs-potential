//===================== Imports =====================//

use std::ops::{Add, Index, IndexMut, Mul, Sub};

//===================== Struct =====================//

/// ### Description
/// 
/// The variables where the 2HDM potential is minimized
/// 
/// ### Parameters
/// 
/// * `pub r: f64`
/// * `pub phi: f64`
/// * `pub chi: f64`
#[derive(Default)]
pub struct Variables {
    pub r: f64,
    pub phi: f64,
    pub chi: f64
}

//===================== Implementations =====================//

impl Variables {

    /// ### Description
    /// 
    /// Creates a new Variables struct
    /// 
    /// ### Function parameters
    /// 
    /// * `r: f64`
    /// * `phi: f64`
    /// * `chi: f64`
    /// 
    /// ### Returns
    /// 
    /// * `Self`
    pub fn new (
        r: f64,
        phi: f64,
        chi: f64
    ) -> Self {
        Self {
            r,
            phi,
            chi
        }
    }
}

// Implementation necessary when cloning a struct
impl Clone for Variables {
    fn clone(&self) -> Self {
        Self {
            r: self.r,
            phi: self.phi,
            chi: self.chi,
        }
    }
}

// Implementation necessary when adding two structs
impl Add for &Variables {
    type Output = Variables;

    fn add(self, var: &Variables) -> Variables {
        Variables {
            r: self.r + var.r,
            phi: self.phi + var.phi,
            chi: self.chi + var.chi
        }
    }
}

// Implementation necessary when substracting two structs
impl Sub<&Variables> for &Variables {
    type Output = Variables;

    fn sub(self, var: &Variables) -> Variables {
        Variables {
            r: self.r - var.r,
            phi: self.phi - var.phi,
            chi: self.chi - var.chi
        }
    }
}

// Implementation necessary when multiplying a struct by a `f64`
impl Mul<f64> for &Variables {
    type Output = Variables;

    fn mul(self, lambda: f64) -> Variables {
        Variables {
            r: self.r * lambda,
            phi: self.phi * lambda,
            chi: self.chi * lambda
        }
    }
}

// Implementation necessary when accessing a struct by index
impl Index<i32> for Variables {
    type Output = f64;

    fn index(&self, i: i32) -> &Self::Output {
        match i {
            0 => &self.r,
            1 => &self.phi,
            2 => &self.chi,
            _ => panic!("Index out of bounds")
        }
    }
}

// Implementation necessary when muting a struct by index
impl IndexMut<i32> for Variables {
    fn index_mut(&mut self, i: i32) -> &mut Self::Output {
        match i {
            0 => &mut self.r,
            1 => &mut self.phi,
            2 => &mut self.chi,
            _ => panic!("index out of bounds"),
        }
    }
}