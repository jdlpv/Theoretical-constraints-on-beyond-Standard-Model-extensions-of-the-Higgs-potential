/// ###  Description
///
/// The different 2HDM extension 
#[derive(PartialEq)]
pub enum PotentialType {

    /// 2HDM extension that conserves Z2 symmetry
    Z2Conserving2HDM,

    /// 2HDM extension that violates Z2 symmetry
    /// but preserves the relation: rho_6_eff = rho_7_eff
    Z2Violating2HDMSymmetric,

    /// 2HDM extension that violates Z2 symmetry
    /// but preserves the relation: rho_6_eff = - rho_7_eff
    Z2Violating2HDMAntisymmetric,

    /// 2HDM extension that does not conserve Z2 symmetry (most general case).
    Z2Violating2HDM
}