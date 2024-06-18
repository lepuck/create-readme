# AppleScript to Create README in current directory

This AppleScript automates the creation of a new README.md file in the currently active Finder directory on macOS. The script includes default content based on the MIT License template.

## Installation

1. Launch Automator
2. Create a Quick Action: Choose File > New and select Quick Action. 
3. Configure the Quick Action:
        Set "Workflow receives current" to "folders" in "Finder.app".
        Ensure that "no input" is selected if you want the script to run with no specific folder selected, using the front Finder window by default.
4. Add AppleScript:
        Drag Run AppleScript from library into the workflow area.
        Copy and paste the provided AppleScript into the editor. Modify as needed.
