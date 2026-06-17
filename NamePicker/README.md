# NamePicker
A lightweight, portable desktop application that randomly selects names from a list, developed to meet my physics teacher's need.

## Usage
- **Prepare Files**: Ensure the following files are located in the same directory as the script or executable:
  1. `config.ini` (Optional; uses defaults if missing)
  2. `namelist.txt` (Required)
  3. `punish.txt` (Optional)

- **Run**: Execute the script or the compiled executable.
- **Trigger**: Click the **"随机点名" (Random Roll Call)** button on the control window.
- **Display**: A larger window will appear showing the selected name and punishment (if applicable).
- **Dismiss**: Click **"确认" (Confirm)** to close the result window.
- **Exit**: Press `Escape` when either window is in focus, or right-click the taskbar icon and select **"Exit"**.


## Configuration
All configuration files listed below must be located in the same folder as the executable or script.

### config.ini
Defines the UI dimensions and font size. The file should contain 3 lines with integer values. If missing or invalid, defaults are used (`Width=200`, `Height=100`, `FontSize=32`).

**Format:**
```ini
200
100
32
```
- **Line 1:** Trigger button window width (pixels).
- **Line 2:** Trigger button window height (pixels).
- **Line 3:** Font size for buttons and labels.

Note: Any line after the 3rd line will be ignored.

### namelist.txt
Contains the list of names to pick from. Each name should be on a new line.

**Example:**
```text
Alice
Bob
Charlie
Diana
```

### punish.txt (Optional)
Contains the list of punishments if answered incorrectly. Each punishment should be on a new line. If this file is missing or empty, no punishment will be displayed.

**Example:**
```text
Sing a song
Do 10 push-ups
Tell a joke
```

## Notes

- Ensure text files are saved in **UTF-8** or **ANSI** encoding to avoid character display issues, especially for non-English names.
