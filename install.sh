#!/bin/sh

ywd_root=~/.ywd

print_start_message() {
  echo ""
  echo ""
  echo "Installing..."
  echo ""
  echo ""
  echo ""

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

  echo ""
  echo ""
  echo ""
}


print_end_message() {
  echo ""
  echo ""
  echo "DONE!"
}


init_and_update_submodules() {
  echo 'Downloading YWD submodules...'
  cd ~/.ywd || { echo 'Unable to enter ~/.ywd'; exit 1; }
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
  echo 'Creating directories for your ZSH customizations...'
  mkdir -p "$HOME/.zsh.before"
  mkdir -p "$HOME/.zsh.after"
  mkdir -p "$HOME/.zsh.prompts"

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


install_packages_using_dnf() {
  # Exit if pip is not installed
  which pip || { echo 'Pip must be installed'; exit 1; }

  echo 'Upgrading pip...'
  sudo pip install --upgrade pip
  echo 'Installing necessary prerequisites with pip...'
  sudo pip install neovim

  echo 'Installing packages...'
  sudo dnf -y install python2-greenlet-devel dnf-plugins-core
  sudo dnf -y copr enable dperson/neovim
  sudo dnf -y install fasd neovim zsh ctags tmux the_silver_searcher
}


install_fonts() {
  echo 'Installing patched fonts for Powerline/Lightline...'

  case "$current_platform" in
    linux)
      mkdir -p ~/.fonts && cp ~/.ywd/fonts/* ~/.fonts && fc-cache -vf ~/.fonts
      ;;
  esac
}


install_neovim_plugins() {
  echo 'Installing neovim plugins...'

  nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'
}


abs_path() {
  if [ -d "$1" ]; then
    (cd "$1" && pwd)
  elif [ -e "$1" ]; then
    (cd "$(dirname "$1")" && echo "$(pwd)/$(basename "$1")")
  else
    echo "$1" does not exist! >&2 && exit 1
  fi
}


create_link_with_backup() {
  filename="$(abs_path "$1")"
  link_source="$(abs_path "$2")"
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
      echo "Already installed: $filename"
    fi
  fi

  echo ''
}


link_config_files() {
  echo 'Linking config files...'

  create_link_with_backup ~/.agignore ~/.ywd/ag/agignore
  create_link_with_backup ~/.aprc ~/.ywd/irb/aprc
  create_link_with_backup ~/.ctags ~/.ywd/ctags/ctags
  create_link_with_backup ~/.editrc ~/.ywd/editline/editrc
  create_link_with_backup ~/.escaped_colors.rb ~/.ywd/irb/escaped_colors.rb
  create_link_with_backup ~/.gemrc ~/.ywd/ruby/gemrc
  create_link_with_backup ~/.gitconfig ~/.ywd/git/gitconfig
  create_link_with_backup ~/.gitignore ~/.ywd/git/gitignore
  create_link_with_backup ~/.inputrc ~/.ywd/readline/inputrc
  create_link_with_backup ~/.pryrc ~/.ywd/irb/pryrc
  create_link_with_backup ~/.rdebugrc ~/.ywd/ruby/rdebugrc
  create_link_with_backup ~/.tmux.conf ~/.ywd/tmux/tmux.conf
  create_link_with_backup ~/.unescaped_colors.rb ~/.ywd/irb/unescaped_colors.rb
  create_link_with_backup ~/.zlogin ~/.ywd/zsh/prezto/runcoms/zlogin
  create_link_with_backup ~/.zlogout ~/.ywd/zsh/prezto/runcoms/zlogout
  create_link_with_backup ~/.zprezto ~/.ywd/zsh/prezto
  create_link_with_backup ~/.zpreztorc ~/.ywd/zsh/prezto-override
  create_link_with_backup ~/.zprofile ~/.ywd/zsh/prezto/runcoms/zprofile
  create_link_with_backup ~/.zshenv ~/.ywd/zsh/prezto/runcoms/zshenv
  create_link_with_backup ~/.zshrc ~/.ywd/zsh/prezto/runcoms/zshrc

  echo 'Done linking config files.'
}




# Main

sudo echo 'Sudo power obtained.'

get_current_platform
get_package_manager
print_start_message
init_and_update_submodules
install_packages
install_zsh
install_fonts
install_neovim_plugins
link_config_files
print_end_message
