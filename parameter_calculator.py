import numpy as np
from scipy.optimize import differential_evolution
from joblib import Parallel, delayed

name_parameter = ['rho_3', 'rho_4', 'rho_5', 'gamma', 'rho_6', 'alpha', 'rho_7', 'xi']
name_function_variables = ['r', 'beta', 'chi']
num_parameter = len(name_parameter)
num_functiion_variables = len(name_function_variables)


function_variable_regions = [(0, 1),         # r
                             (0, 4*np.pi),   # beta
                             (0, np.pi/2)]   # chi

def generate_random_params(number, limits):

    limits = np.array(limits)  
    lower_limit = limits[:, 0]  
    upper_limit = limits[:, 1]  

    return np.random.uniform(lower_limit, upper_limit, size=(number, len(limits)))

# Define the Z2-violating potential
def V_Z2_less(parameters, function_variables):
    rho_3_param, rho_4_param, rho_5_param, gamma_param, rho_6_param, alpha_param, rho_7_param, xi_param = parameters
    r, beta, chi = function_variables
    return 2+((rho_3_param+r**2*(rho_4_param+np.abs(rho_5_param)*np.cos(gamma_param+beta)))-1)*(np.sin(2*chi))**2+np.sin(2*chi)*(np.abs(rho_6_param)*r*np.cos(alpha_param+(1/2)*beta)+np.abs(rho_7_param)*r*np.cos(xi_param+(1/2)*beta)+np.cos(2*chi)*(np.abs(rho_6_param)*r*np.cos(alpha_param+(1/2)*beta)-np.abs(rho_7_param)*r*np.cos(xi_param+(1/2)*beta)))

# Minimize the potential in (r, beta, chi) space
def minimize_dependent_params(parameters, bounds):
    def minimize_single(parameter):
        def objective(function_variables):
            return V_Z2_less(parameter, function_variables)
        
        # Scipy native function
        res = differential_evolution(objective, bounds=bounds, strategy='best1bin', tol=1e-6)
        return np.concatenate([parameter, res.x, [res.fun]])

    # Parallel processing
    results = Parallel(n_jobs=4)(delayed(minimize_single)(parameter) for parameter in parameters)
    
    return results

# Explore Z_2-violating 2HDM results

dim = 100000

regions = [(-5, 5),         # rho_3
           (-5, 5),         # rho_4
           (0, 5),          # |rho_5|
           (0, 2*np.pi),    # gamma
           (0, 5),          # |rho_6|
           (0, 2*np.pi),    # alpha
           (0, 5),          # |rho_7|
           (0, 2*np.pi)]    # xi

parameters = generate_random_params(dim, regions)

results = np.array(minimize_dependent_params(parameters, function_variable_regions))
Z2_violating_valid_values = results[results[:, -1] > 0]


# Explore Symmetric Z_2-violating 2HDM results

regions = [(-5, 5),         # rho_3
           (-5, 5),         # rho_4
           (0, 5),          # |rho_5|
           (0, 2*np.pi),    # gamma
           (0, 5),          # |rho_6|
           (0, 2*np.pi),    # alpha
           (0, 0),          # |rho_7| will be overwrtten by |rho_6|
           (0, 0)]          # xi will be overwritten by alpha

parameters = generate_random_params(dim, regions)
parameters[:, 6] = parameters[:, 4]  # rho_7 = rho_6
parameters[:, 7] = parameters[:, 5]  # xi = alpha

results = np.array(minimize_dependent_params(parameters, function_variable_regions))
symmetric_valid_values = results[results[:, -1] > 0]


# Explore Antisymmetric Z_2-violating 2HDM results

regions = [(-5, 5),         # rho_3
           (-5, 5),         # rho_4
           (0, 5),          # |rho_5|
           (0, 2*np.pi),    # gamma
           (0, 5),          # |rho_6|
           (-np.pi, 2*np.pi),    # alpha (limits have been changed in order to visualize the results better. However, this does not change nothign because the potential is periodic in alpha)
           (0, 0),          # |rho_7| will be overwrtten by |rho_6|
           (0, 0)]          # xi will be overwritten by alpha

parameters = generate_random_params(dim, regions)
parameters[:, 6] = parameters[:, 4]  # rho_7 = rho_6
parameters[:, 7] = parameters[:, 5] + np.pi  # xi = alpha+pi (this +pi is the reason why the limits of alpha have been changed)

results = np.array(minimize_dependent_params(parameters, function_variable_regions))
antisymmetric_valid_values = results[results[:, -1] > 0]


# Save the results to a file

np.savetxt('Z2_violating_valid_values.txt', Z2_violating_valid_values , delimiter=',', fmt='%.15f')
np.savetxt('symmetric_valid_values.txt', symmetric_valid_values, delimiter=',', fmt='%.15f')
np.savetxt('antisymmetric_valid_values.txt', antisymmetric_valid_values, delimiter=',', fmt='%.15f') 