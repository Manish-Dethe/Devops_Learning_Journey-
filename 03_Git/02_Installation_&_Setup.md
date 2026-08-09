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