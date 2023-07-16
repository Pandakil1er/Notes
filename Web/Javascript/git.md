Let’s review the dangers we’ve addressed so far. I know, I know, it’s scary stuff - but we have to be mindful or our coworkers might end up hating our guts! If you look back through this lesson you’ll see a common thread. `amend`, `rebase`, `reset`, `push --force` are all especially dangerous when you’re collaborating with others. These commands can destroy work your coworkers have created. So keep that in mind. When attempting to rewrite history, always check the dangers of the particular command you’re using and follow these best practices for the commands we’ve covered:

1. If working on a team project, make sure rewriting history is safe to do and others know you’re doing it.
2. Ideally, stick to using these commands only on branches that you’re working with by yourself.
3. Using the `-f` flag to force something should scare you, and you better have a really good reason for using it.
4. Don’t push after every single commit, changing published history should be avoided when possible.
5. Regarding the specific commands we’ve covered:
    1. For `git amend` never amend commits that have been pushed to remote repositories.
    2. For `git rebase` never rebase a repository that others may work off of.
    3. For `git reset` never reset commits that have been pushed to remote repositories.
    4. For `git push --force` only use it when appropriate, use it with caution, and preferably default to using `git push --force-with-lease`.



rebase
squash
git checkout -b branchname

https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet