<!-- If there’s a checkbox you can’t complete for any reason, that's okay, just explain in detail why you weren’t able to do so. -->

After making all changes to the cask:

- [ ] `brew cask audit --download {{cask_file}}` is error-free.
- [ ] `brew cask style --fix {{cask_file}}` reports no offenses.
- [ ] The commit message includes the cask’s name and version.

Additionally, if **adding a new cask**:

- [ ] Named the cask in a similar way to the existing casks.
- [ ] Added new cask to the README.md
- [ ] `brew cask install {{cask_file}}` worked successfully.
- [ ] `brew cask uninstall {{cask_file}}` worked successfully.
- [ ] Checked there are no [open pull requests] for the same cask.
