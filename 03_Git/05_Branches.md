# Git Branching
- Each commit has a unique hash (SHA-1).
- Each commit references its parent commit.
- The first commit has no parent.
- Without branches, Git has a linear history.

## Branches
- Branches allow us to work on multiple contexts independently.
- They can be thought of as **alternative timelines** for a project.
- Changes on one branch do not affect other branches.
- Branches allow us to experiment, work in parallel, and break things safely.

## Merging
- **Merging** combines changes from different branches.
- A completed bug fix or feature can be merged into the main code base.

# Git Default Branch
- In Git, you are always working on a branch.
- `git init` automatically creates the default branch `master`.
- `master` is not special in Git; it works like any other branch.
- The default branch can be renamed or deleted.

## Master vs Main
- GitHub changed its default branch name from `master` to `main` in 2020.
- Git traditionally uses `master` as the default branch.
- In the course:
  - Git → `master`
  - GitHub → `main`

## Feature Branching
- `master`/`main` is often treated as the **source of truth** or main code base.
- New features and experiments can be developed on separate **feature branches**.
- Completed features can be merged back into `master`/`main`.
- Unwanted experimental branches can be abandoned.

# HEAD
- `HEAD` is a pointer that refers to our current location in the repository.
- `HEAD` points to the current branch reference.
- `HEAD -> master` means `HEAD` is pointing to the `master` branch.
- The **tip of a branch** is its latest commit.

## Branch Reference
- A branch is a reference to a commit.
- Each branch has a branch reference pointing to where the branch currently is.
- When a new commit is made, the branch pointer moves to the new commit.
- `HEAD` stays with the current branch.

## Switching Branches
- When switching branches, `HEAD` moves to the selected branch.
- `HEAD` always points to the branch currently being worked on.
- Different branches can point to different commits.

# Git Branch
- `git branch` lists all existing branches in the repository.
- It does not create or switch branches.
- The current branch is marked with an `*` (asterisk).

# Creating Branches
- `git branch` lists the existing branches.
- `git branch <branch-name>` creates a new branch.
- Creating a branch does not switch to it.
- The new branch points to the same commit as the current `HEAD`.
- Branch names should not contain spaces and should be meaningful.

## Switching Branches
- `git switch <branch-name>` switches to another branch.
- `HEAD` moves to the branch you switch to.
- Commits made after switching belong to that branch.
- Other branches remain unchanged.

# Git Checkout and Git Switch
- `git checkout <branch-name>` switches to an existing branch.
- `git checkout` is the older command and can perform multiple operations.
- `git switch <branch-name>` is the newer command specifically for switching branches.
- `git switch` is preferred for switching branches.

## Create and Switch to a Branch
- `git switch -c <branch-name>` creates a new branch and switches to it.
- `-c` means create.

git switch -c recentish-music
- `git checkout -b <branch-name>` does the same thing.
- `-b` means branch.

git checkout -b recentish-music
- Without `-c` or `-b`, the branch must already exist.
- Branches can contain multiple files and folders.
- Branches are not limited to a single file.
- Switching branches updates the relevant files and folders according to the selected branch.

# Switching Branches with Uncommitted Changes
- If you have uncommitted changes and try to switch branches, Git may prevent the switch.
- If the changes would be overwritten or conflict with the target branch, Git shows an error.
- Git asks you to either **commit** or **stash** the changes.