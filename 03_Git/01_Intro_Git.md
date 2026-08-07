# What is Git?
- **Git** is a **Version Control System (VCS)**.
- It tracks and manages changes made to files over time.
- It helps developers:
  - Track changes
  - Revert to previous versions
  - Compare file versions
  - Collaborate with multiple developers

## Why Git?
- Industry-standard Version Control System.
- Used in almost every software company.
- Suitable for both small and large projects.
- Free, Open Source, and Distributed.

## Other Version Control Systems
- SVN (Subversion)
- CVS
- Mercurial
> Git is the most popular VCS among them.

# What Git Does
- Tracks changes across project files.
- Compares different versions of a project.
- Restores (reverts) to previous versions.
- Combines changes from multiple developers.
- Enables collaboration in a team.

## Git Checkpoints
- Git saves project **checkpoints (snapshots)**.
- A checkpoint allows you to:
  - Restore previous work.
  - Recover from mistakes.
  - Continue development safely.

**Example Workflow:**
```
Initialize Project
      ↓
Add Navbar
      ↓
Add Content
      ↓
Change Theme
      ↓
Update Navbar
```

## Key Benefits
- Undo mistakes without losing the project.
- Switch between different project versions.
- Merge changes from different versions.
- Manage large projects with multiple developers.

> **Remember:** Git is like a game's **Save Point** — you can always return to a previously saved version.

# Git vs GitHub

| Git | GitHub |
|------|---------|
| Version Control System (VCS) | Cloud-based hosting service for Git repositories |
| Installed on local machine | Runs on the internet |
| Works without internet | Requires internet |
| No account required | GitHub account required |
| Tracks project changes | Stores & shares Git repositories |
| Can be used independently | Built to work with Git |

## Workflow

```text
Local Project (Git)
        ↓
   Push to GitHub
        ↓
Other Developers
        ↓
Pull/Clone Changes
        ↓
Collaborate Together
```

> **Remember:** **Git = Tool** | **GitHub = Platform to host Git projects**