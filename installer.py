import os
import subprocess

# Define the file path
path = "~/server/Server"

file_path = os.path.expanduser(path)

dire = "~/server/"

dire_path = os.path.expanduser(dire)

# Check if the file exists
if os.path.exists(file_path):
    # Execute the file using subprocess
    subprocess.call([file_path], cwd=dire_path)
else:
    # Execute the installer.sh script using subprocess
    print("\nInstaller script executed since the server file does not exist.\n")
    subprocess.call(['bash', 'installer.sh'])
