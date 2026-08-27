# Theoretical constraints on beyond Standard Model extensions of the Higgs potential

Complutense University of Madrid, Faculty of Physics, Theoretical Physics Department.

**Title**: Theoretical constraints on beyond Standard Model extensions of the Higgs potential.

**Authors**: Carlos Ariel Quezada Calonge, Juan José Sanz Cillero and Javier Eloy de la Peña Vico.

## **IMPORTANT**
This code shall be understood as an attached file to the paper mentioned hererinabove. It should never be treated "AS IS".

In order to see how some of the figures referenced in the scientific paper were obtained, see [parameter_visualizer.ipynb](parameter_visualizer.ipynb). 

In order to replicate the results obtained by the DE/best/1/bin algorithm, you need to run [main.rs](main.rs) which will generate two text files (.txt) that can subsequently be read using [parameter_visualizer.ipynb](parameter_visualizer.ipynb).

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/jdlpv/Theoretical-constraints-on-beyond-Standard-Model-extensions-of-the-Higgs-potential.git
   ```

2. Navigate into the project folder:
   ```bash
   cd Theoretical-constraints-on-beyond-Standard-Model-extensions-of-the-Higgs-potential
   ```

3. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

4. Activate the virtual environment:
   - On Windows:
     ```bash
     venv\Scripts\activate
     ```
   - On macOS/Linux:
     ```bash
     source venv/bin/activate
     ```

5. Install Jupyter and dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Additional steps (when using Rust)

6. In order to run [main.rs](main.rs), please ensure that Rust is properly installed on your system. Open and run the script.

### Additional steps (if using Jupyter Notebook IDE)

7. Add the virtual environment to Jupyter:
   ```bash
   python -m ipykernel install --user --name=venv --display-name "Jupyter (venv)"
   ```

8. Launch Jupyter Notebook:
   ```bash
   jupyter notebook
   ```
   Then, in Jupyter:
   - Open a new notebook.
   - Go to **Kernel > Change Kernel**.
   - Select **"Jupyter (venv)"**.


## License

This project is licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license. 

### Summary of the License:

- You are free to **share** (copy and redistribute) and **adapt** (remix, transform, and build upon) this work for any purpose.
- You must provide **appropriate credit**, link to the license, and indicate if changes were made.
- No additional restrictions can be applied beyond those stated in the license.

For more details, refer to the full license: [CC BY 4.0](https://choosealicense.com/licenses/cc-by-4.0/).

## Contact

For any questions or further information, feel free to contact the Author at:

- jadelape@ucm.es