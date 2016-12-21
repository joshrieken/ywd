# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.ywd.local/zsh/after/)" ]; then
    for config_file ($HOME/.ywd.local/zsh/after/*.zsh) source $config_file
  fi
fi
