#!/bin/bash

# Define the output file
OUTPUT_FILE="README.md"

# Fetch the versions safely using 'python'
PYTHON_VERSION=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}')")
ASE_VERSION=$(python -c "import ase; print(ase.__version__)" 2>/dev/null || echo "Not Installed")
GPAW_VERSION=$(python -c "import gpaw; print(gpaw.__version__)" 2>/dev/null || echo "Not Installed")
AGOX_VERSION=$(python -c "import agox; print(agox.__version__)" 2>/dev/null || echo "Not Installed")

# Write the contents to the README file
cat << EOF > $OUTPUT_FILE
# Computational Environment Setup

This repository contains the simulation and machine learning framework for the project. Below are the verified software environment configurations used during execution.

## Software Dependencies

| Software / Package | Version |
| :--- | :--- |
| **Python** | $PYTHON_VERSION |
| **ASE** (Atomic Simulation Environment) | $ASE_VERSION |
| **GPAW** (DFT Calculator) | $GPAW_VERSION |
| **AGOX** (Global Optimization Framework) | $AGOX_VERSION |

---
*Generated automatically on $(date '+%Y-%m-%d')*
EOF

echo "Success: $OUTPUT_FILE has been generated with your environment versions."