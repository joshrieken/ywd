#!/bin/sh

# Kill ourself when receiving a SIGINT.
trap '
  trap - INT # restore default INT handler
  kill -s INT "$$"
' INT

ywd_root="$HOME"/.ywd
ywd_local_root="$HOME"/.ywd.local

print_start_message() {
  echo ''
  echo ''
  echo 'Installing...'
  echo ''
  echo ''
  echo ''

  cat << "EndOfMessage"
                                                 .-'''-.
                                              '   _    \
                         .             .    /   /` '.   \
 .-.          .-       .'|           .'|   .   |     \  '
  \ \        / /     .'  |         .'  |   |   '      |  '
   \ \      / / __  <    |        <    |   \    \     / /
    \ \    / .:--.'. |   | ____    |   | ___`.   ` ..' /
     \ \  / / |   \ ||   | \ .'    |   | \ .'  '-...-'`
      \ `  /`" __ | ||   |/  .     |   |/  .
       \  /  .'.''| ||    /\  \    |    /\  \
       / /  / /   | ||   |  \  \   |   |  \  \
   |`-' /   \ \._,\ ''    \  \  \  '    \  \  \
    '..'     `--'  `'------'  '---'------'  '.-'''-.
                                            '   _    \
                       .             .    /   /` '.   \
       _     _       .'|           .'|   .   |     \  '
 /\    \\   //     .'  |         .'  |   |   '      |  '
 `\\  //\\ // __  <    |        <    |   \    \     / /
   \`//  \'.:--.'. |   | ____    |   | ___`.   ` ..' /
    \|   |/ |   \ ||   | \ .'    |   | \ .'  '-...-'`
     '    `" __ | ||   |/  .     |   |/  .
           .'.''| ||    /\  \    |    /\  \
          / /   | ||   |  \  \   |   |  \  \
          \ \._,\ ''    \  \  \  '    \  \  \
           `--' .-'''-.--'  '---'------'  '---'
_______        '   _    \                  .---.
\  ___ `'.   /   /` '.   \              .--|   |     __.....__
 ' |--.\  \ .   |     \  '          _.._|__|   | .-''         '.
 | |    \  '|   '      |  ' .|    .' .._.--|   |/     .-''"'-.  `.
 | |     |  \    \     / /.' |_   | '   |  |   /     /________\   \
 | |     |  |`.   ` ..' .'     |__| |__ |  |   |                  |   _
 | |     ' .'   '-...-''--.  .-|__   __||  |   \    .-------------' .' |
 | |___.' /'              |  |    | |   |  |   |\    '-.____...---..   | /
/_______.'/               |  |    | |   |__|   | `.             ..'.'| |//
\_______|/                |  '.'  | |      '---'   `''-...... -.'.'.-'  /
                          |   /   | |                          .'   \_.'
                          `'-'    |_|
EndOfMessage

  echo ''
  echo ''
  echo ''
}


print_end_message() {
  echo ''
  echo 'Finished installing YWD! Have Fun!'
}


print_separator() {
  echo ''
}


init_and_update_submodules() {
  echo 'Downloading YWD submodules...'
  cd "$ywd_root" || { echo "Unable to enter $ywd_root"; exit 1; }
  git submodule update --init --recursive
  git clean -df
}


get_package_manager() {
  raw_platform=$(python -mplatform | tr '[:upper:]' '[:lower:]')
  case "$raw_platform" in
    *fedora*)
      package_manager='dnf'
      echo 'Package manager is DNF.'
      ;;
    # *ubuntu*)
    #   package_manager='apt'
    #   ;;
    # *darwin*)
    #   package_manager='brew'
    #   ;;
    *)
      echo 'Your system is not yet supported (must be one of: Fedora)'
      exit 1
      ;;
  esac
}


get_current_platform() {
  raw_platform=$(python -mplatform | tr '[:upper:]' '[:lower:]')
  case "$raw_platform" in
    *linux*)
      current_platform='linux'
      echo 'Current platform is Linux.'
      ;;
    # *ubuntu*)
    #   current_platform='ubuntu'
    #   ;;
    # *darwin*)
    #   current_platform='darwin'
    #   ;;
    *)
      echo 'Your system is not yet supported (must be one of: Fedora)'
      exit 1
      ;;
  esac
}


install_packages() {
  case "$package_manager" in
    dnf)
      install_packages_using_dnf
      echo 'Done installing packages.'
      ;;
    # apt)
    #   install_packages_using_apt
    #   ;;
    # brew)
    #   install_packages_using_brew
    #   ;;
  esac
}


contains() {
  string="$1"
  substring="$2"
  if test "${string#*$substring}" != "$string"
  then
      return 0    # $substring is in $string
  else
      return 1    # $substring is not in $string
  fi
}


install_zsh() {
  case "$SHELL" in
    *zsh*)
      echo 'ZSH is already your current shell. Restart your session to load the new settings.'
      ;;
    *)
      echo 'Setting ZSH as your default shell...'
      chsh -s "$(which zsh)"
      ;;
  esac
}


install_tmux_plugins() {
  echo 'Installing Tmux Plugin Manager...'
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo 'Done installing Tmux Plugin Manager.'

  echo 'Installing TPM plugins...'

  "$HOME"/.tmux/plugins/tpm/bin/install_plugins

  echo 'Done installing TPM plugins.'
}


install_packages_using_dnf() {
  # Exit if Python 3 is not installed
  which python3 || { echo 'Python 3 must be installed'; exit 1; }

  echo 'Installing pip for Python 3...'
  sudo dnf -y install python3-pip
  echo 'Upgrading pip...'
  sudo python3 -m pip install --upgrade pip
  echo 'Installing necessary prerequisites with pip...'
  sudo python3 -m pip install neovim

  echo 'Installing DNF packages...'
  sudo dnf -y install python2-greenlet-devel dnf-plugins-core \
    fasd neovim zsh tmux the_silver_searcher python2-neovim python3-neovim

  echo 'Installing Universal Ctags...'
  mkdir -p "$HOME/tmp/ywd-install"
  git clone git@github.com:universal-ctags/ctags.git "$HOME/tmp/ywd-install/ctags"
  (
    cd "$HOME/tmp/ywd-install/ctags"
    ./autogen.sh
    ./configure
    make
    sudo make install
  )
  rm -fr "$HOME/tmp/ywd-install/ctags"
}


install_fonts() {
  echo 'Installing patched fonts for Powerline/Lightline...'

  case "$current_platform" in
    linux)
      mkdir -p "$HOME"/.fonts && cp "$ywd_root"/fonts/* "$HOME"/.fonts && fc-cache -vf "$HOME"/.fonts
      ;;
  esac

  echo 'Finished installing patched fonts for Powerline/Lightline.'
}


install_neovim_plugins() {
  echo 'Installing neovim plugins...'

  # Use a minimalist config while installing plugs.
  nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall' -u "$ywd_root"/nvim/init.first.vim

  echo 'Done installing neovim plugins.'
}


create_link_with_backup() {
  filename="$1"
  link_source="$2"
  backup_filename="$filename-$(date +"%Y%m%d%H%M%S")-$(./rand.sh).bak"

  echo ''

  if [ -e "$filename" ]; then
    if [ "$(readlink -- "$filename")" != "$link_source" ]; then
      echo "Backing up $filename to $backup_filename..."
      cp "$filename" "$backup_filename"
      echo "Removing original $filename..."
      rm "$filename"
      echo "Linking new $filename..."
      ln -nfs "$link_source" "$filename"
    else
      echo "Already linked: $filename"
    fi
  else
    echo "Linking new $filename..."
    ln -nfs "$link_source" "$filename"
  fi

  echo ''
}


link_config_files() {
  echo 'Linking config files...'

  create_link_with_backup "$HOME"/.agignore "$ywd_root"/ag/agignore
  create_link_with_backup "$HOME"/.aprc "$ywd_root"/irb/aprc
  create_link_with_backup "$HOME"/.ctags "$ywd_root"/ctags/ctags
  create_link_with_backup "$HOME"/.editrc "$ywd_root"/editline/editrc
  create_link_with_backup "$HOME"/.escaped_colors.rb "$ywd_root"/irb/escaped_colors.rb
  create_link_with_backup "$HOME"/.gemrc "$ywd_root"/ruby/gemrc
  create_link_with_backup "$HOME"/.gitconfig "$ywd_root"/git/gitconfig
  create_link_with_backup "$HOME"/.gitignore "$ywd_root"/git/gitignore
  create_link_with_backup "$HOME"/.inputrc "$ywd_root"/readline/inputrc
  create_link_with_backup "$HOME"/.pryrc "$ywd_root"/irb/pryrc
  create_link_with_backup "$HOME"/.rdebugrc "$ywd_root"/ruby/rdebugrc
  create_link_with_backup "$HOME"/.tmux.conf "$ywd_root"/tmux/tmux.conf
  create_link_with_backup "$HOME"/.unescaped_colors.rb "$ywd_root"/irb/unescaped_colors.rb
  create_link_with_backup "$HOME"/.zlogin "$ywd_root"/zsh/prezto/runcoms/zlogin
  create_link_with_backup "$HOME"/.zlogout "$ywd_root"/zsh/prezto/runcoms/zlogout
  create_link_with_backup "$HOME"/.zprezto "$ywd_root"/zsh/prezto
  create_link_with_backup "$HOME"/.zpreztorc "$ywd_root"/zsh/prezto-override/zpreztorc
  create_link_with_backup "$HOME"/.zprofile "$ywd_root"/zsh/prezto/runcoms/zprofile
  create_link_with_backup "$HOME"/.zshenv "$ywd_root"/zsh/prezto/runcoms/zshenv
  create_link_with_backup "$HOME"/.zshrc "$ywd_root"/zsh/prezto/runcoms/zshrc

  mkdir -p "$HOME"/.config
  create_link_with_backup "$HOME"/.config/nvim "$ywd_root"/nvim

  echo 'Done linking config files.'
}


create_ywd_local_dirs() {
  echo "Creating $ywd_local_root for customizations..."
  mkdir -p "$ywd_local_root"/vim/before
  mkdir -p "$ywd_local_root"/vim/plugs/before
  mkdir -p "$ywd_local_root"/vim/plugs/after
  mkdir -p "$ywd_local_root"/vim/after
  mkdir -p "$ywd_local_root"/zsh/before
  mkdir -p "$ywd_local_root"/zsh/after
  mkdir -p "$ywd_local_root"/zsh/prompts
}




# Main

sudo echo 'Sudo power obtained.'

get_current_platform
get_package_manager
print_start_message
init_and_update_submodules
install_packages
install_zsh
install_tmux_plugins
install_fonts
link_config_files
install_neovim_plugins
create_ywd_local_dirs
print_end_message
