
# ComfyUI Python Application Development Environment

This repository contains the setup for ComfyUI, enhanced with debugging capabilities using `debugpy`. This guide will help you set up and run the ComfyUI application, ensure that necessary ports are available, and configure VSCode for debugging.

## Prerequisites

- ComfyUI installed and working. Visit [ComfyUI Repository](https://github.com/comfyanonymous/ComfyUI) for more details.
- [VSCode](https://code.visualstudio.com/) with the Python extension installed

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/KewkLW/comfyui-dev-env.git
   ```

2. **Modify the Script**:
   - Open the `run_comfyui-debug.sh` script in a text editor.
   - Replace `CHANGE ME` next to `source activate` with the name of your Conda environment for ComfyUI.
   - Replace `CHANGE ME` in the `cd` command with the path to your ComfyUI project directory. You can then run the script from whereever. 

3. **Activate your ComfyUI Conda Environment**:
   ```bash
   conda activate <your_comfyui_env_name>
   ```

4. **Install Dependencies**:
   ```bash
   pip install debugpy
   ```

## Setting Up the Debugger

The `run_comfyui-debug.sh` script is designed to:
- Activate the specified Conda environment.
- Check and free up the necessary ports.
- Run the ComfyUI application with `debugpy` listening for debugger connections.

### Script Configuration:
- Default application port: `8180`
- Default debugger port: `8190`

## Running the Application

To start the application with the debugger enabled:

```bash
./run_comfyui-debug.sh
```

## Configuring VSCode for Debugging

To connect VSCode to the `debugpy` server:

1. **Open VSCode** in the project directory.
2. **Configure using the provided `launch.json`**, which is included in the repository.

3. **Start Debugging**:
   - Go to the Run view (Ctrl+Shift+D) and select 'Python: Attach'.
   - Click the green 'Start Debugging' button.

## Common Issues and Troubleshooting

- **Port Already in Use**: Manually check which processes are using the ports with `lsof -i :<port>` and terminate them if necessary.
- **Debugging Not Starting**: Ensure that `debugpy` is correctly installed in the Conda environment and that the application is configured to wait for the debugger connection.
