# How to remove a git submodule
https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule/36593218#36593218

## Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

## Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

## Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
