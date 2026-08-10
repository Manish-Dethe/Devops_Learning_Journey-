# Ways to Use Git
Git can be used in two main ways:

## 1. Command Line (CLI)
- Git was designed primarily as a **command-line tool**.
- Most developers use Git through the terminal.
- Commands are consistent across machines.
- Faster and more powerful once you are comfortable with it.
- Important skill for DevOps/Developers.

## 2. GUI (Graphical User Interface)
- Provides a visual way to interact with Git.
- Easier for beginners.
- Examples:
  - GitHub Desktop
  - GitKraken
  - SourceTree
  - Tower

### CLI vs GUI

| CLI | GUI |
|---|---|
| Command-based | Visual/buttons |
| More powerful/flexible | Easier to use |
| Requires practice | Beginner-friendly |
| Consistent commands | Interface differs between tools |

# Git Configuration
Git needs your **name and email** to identify who made changes/commits.

### Set Username
```bash
git config --global user.name "Your Name"
```

### Set Email
```bash
git config --global user.email "your@email.com"
```

### Check Configuration
```bash
git config user.name
git config user.email
```

### Important
- Use a consistent name.
- Prefer the email associated with your **GitHub account**.
- `--global` applies the configuration to Git across your machine.

# Basic Terminal Commands

## Navigation
`ls` → List files and folders
`ls <folder>` → List contents of a folder
`pwd` → Show current directory
`cd <folder>` → Enter a folder
`cd ..` → Go back one directory
`clear` → Clear terminal

## File & Folder Creation
`touch <file>` → Create an empty file
`mkdir <folder>` → Create a directory

## Deletion
`rm <file>` → Delete a file
`rm -rf <folder>` → Delete a folder and its contents
- `-r` → Recursive
- `-f` → Force

## Opening Folders
`open .` → Open current folder on macOS
`start .` → Open current folder on Windows

## Shortcuts
`~` → Home directory
`Tab` → Auto-complete file/folder names

### Important
- These commands are **not Git commands**.
- They are used to navigate and manage files/folders while working with Git.
- On Windows, **Git Bash** provides a Unix-like terminal.
- On macOS/Linux, you can use the **Terminal**.