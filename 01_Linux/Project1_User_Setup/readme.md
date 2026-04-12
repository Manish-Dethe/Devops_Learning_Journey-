# Linux Project 1: User & Permission Setup

## Objective

The goal of this project is to understand how user management and permissions work in Linux and how to secure a directory so that only authorized users can access it.

---

## Steps I Performed

* Created a new user named `devops`
* Set password for the user
* Created a directory `/project` in the root
* Changed ownership of the directory to `devops`
* Applied permissions to restrict access
* Logged in as `devops` and created files inside the directory

---

## Security Testing

* Tried accessing `/project` using another user
* Access was denied

This shows that the permissions are correctly applied and the directory is secure.

---

## What I Learned

* Difference between user, group, and others
* How ownership works in Linux
* How to apply permissions using chmod
* Importance of restricting access in real servers

---

## Project Structure

* `/project` → main directory created for this project

---

## Conclusion

This project helped me understand how Linux permissions and user access control work in real-world DevOps environments.

## 🔧 Commands Used
adduser, chmod, chown, ls, cd