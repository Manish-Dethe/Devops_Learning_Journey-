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

# Git Commit
- **Commit** = A checkpoint/snapshot of changes in a Git repository.
- A repository can have many commits, creating a history of changes.
- A commit includes:
  - Changes made to the project
  - A commit message describing the changes

## Commit Workflow
1. Make changes to files and save them.
2. Select the changes to include using `git add`.
3. Create the commit using `git commit`.

```bash
git add <file>
git commit -m "message"
```

# git add
`git add` → Stages changes for the next commit.

## Git Workflow
`Working Directory` → Make or modify files
`Staging Area` → Select changes using `git add`
`Repository` → Stores commits in `.git`

## Commands
`git status` → Check the current status of the repository.
`git add <file>` → Stage a specific file
`git add file1 file2` → Stage multiple files.

## Important
- `git add` does **not** create a commit.
- It moves selected changes from the **Working Directory → Staging Area**.
- Use `git status` to check staged and unstaged changes.

# git commit
`git commit` → Creates a commit using the changes that were previously staged.

## Commit Message
- Every commit should have a **commit message**.
- The message should briefly summarize the changes included in the commit.

## Recommended Command
`git commit -m "message"` → Creates a commit with the given message.
Example:
`git commit -m "Start work on outline and main characters"`

## Important
- `git add` → Stages changes
- `git commit` → Saves staged changes as a commit
- `-m` → Provides the commit message directly in the command.
- Using `git commit` without `-m` may open the default editor (such as Vim).

## Workflow
`Make Changes` → `git add` → `git commit -m "message"`

## Working Tree Clean
`git status` showing `working tree clean` means there are no uncommitted changes.

# Git Log & Git Add

## `git status`
`git status` → Shows new, modified, and staged changes.
- **Untracked** → New file Git is not tracking yet.
- **Modified** → Existing tracked file has been changed.

## `git add`
`git add <file>` → Stage a specific file.
`git add file1 file2` → Stage multiple files.
`git add .` → Stage all current changes at once.
> Use `git add .` when all changes belong to the same commit. Otherwise, selectively stage files.

## `git commit`
`git commit -m "message"` → Creates a commit from staged changes.

## `git log`
`git log` → Shows the commit history of the repository.
It includes:
- Commit hash
- Author
- Date
- Commit message

> **Remember:** `git add .` stages changes; `git commit` creates the checkpoint.