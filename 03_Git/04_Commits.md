# Atomic Commits
- **Atomic commit** → A commit focused on a single feature, change, or fix.
- Keep each commit focused on **one logical task**.
- It does **not** mean one file; one change can involve multiple files.

## Why Atomic Commits?
- Easier to review.
- Easier to understand the project history.
- Makes reverting/undoing a specific change safer.
- Prevents unrelated changes from being grouped together.

## Example
Instead of:
`git add .` → Commit multiple unrelated changes

Prefer separate commits:
`git add <files>` → `git commit -m "Rename Gatsby to Catsby"`
`git add <files>` → `git commit -m "Create mood board"`
> **Rule:** Keep commits small and focused, but don't split them unnecessarily.

# Commit Message Style
- Git documentation recommends **present tense + imperative mood** for commit messages.
- Write the message like an instruction to the codebase.

## Important
- Present-tense imperative style is a **Git convention**, not a strict requirement.
- The Git community is divided between present and past tense.
- In a company or open-source project, **follow their commit message guidelines**.
- Most importantly, keep your commit messages **consistent**.

> **Rule:** Use present-tense imperative messages unless your team/project follows a different convention.

# Git Commit Editor
- `git commit` → Opens the default editor to enter a commit message.
- The default editor may be **Vim**.
- `git commit -m "message"` → Creates a commit with a message directly.

## Vim Basics
- `i` → Insert mode
- `Esc` → Exit insert mode
- `:wq` → Save and quit

## Configure VS Code
```bash
git config --global core.editor "code --wait"
```

# Git Log
`git log` → Shows the commit history of a repository.

## Useful Option
`git log --oneline` → Shows each commit in a single line with a shortened commit hash.

### Why Use `--oneline`?
- Makes commit history easier to read.
- Shows the **commit hash** and commit message.
- Useful when finding a specific commit to revisit or undo later.

## Commit Message Convention
- The **first line** of a commit message should briefly summarize the change.
- Additional details can be added on following lines.
