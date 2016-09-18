# fasd
# Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v.
# https://github.com/clvv/fasd

# Only runs if fasd is installed.
# Cache fasd init code for lower shell start overhead.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
