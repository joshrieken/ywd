# Load any user customizations prior to load
if [ -d $HOME/.ywd.local/zsh/before ]; then
  if [ "$(ls -A $HOME/.ywd.local/zsh/before/)" ]; then
    for config_file ($HOME/.ywd.local/zsh/before/*.zsh) source $config_file
  fi
fi
