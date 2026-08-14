# Git Repository

- **Repository (Repo)** = A Git workspace for a project.
- A repository contains the project's files and its **Git history**.
- Git must be initialized separately in each project where you want to use Git.
- Each repository has its **own separate history**.
- Multiple repositories can exist on the same machine.
- Repositories are independent of each other.

> **Remember:** Git Repository = Project workspace + Git history

# Git Init & Git Status
`git status` → Shows the current status of the Git repository.
`git init` → Initializes a new Git repository in the current directory.

## Important
- Run `git init` **once per project**.
- Run it inside the project directory.
- After `git init`, the directory becomes a Git repository.
- Use `git status` anytime to check the repository status.

# .git Directory
- `git init` → Creates a hidden `.git` directory.
- `.git` → Stores the Git repository data and history.
- `ls -a` → Shows hidden and non-hidden files/folders.

## Important
- Every Git repository contains a `.git` directory.
- Do **not** manually delete or modify `.git`.
- Deleting `.git` removes the Git repository and its history.

> `.git` is what makes a directory a Git repository.

# Nested Git Repositories

- A Git repository tracks everything inside its directory, including nested folders.
- **Do not initialize a Git repository inside another Git repository.**
- This creates a **nested repository** and can cause confusion.

## Best Practice
- Use **one Git repository per project**.
- Before running `git init`, check: git status