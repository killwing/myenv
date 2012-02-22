# .bash_profile is executed for login shells,
# while .bashrc is executed for interactive non-login shells.

# If running Bash, source .bashrc.
if [ -n "$BASH_VERSION" ]; then
    if [ -e "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

