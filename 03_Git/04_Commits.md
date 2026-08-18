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