# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YWD is installed.
ywd=$HOME/.ywd

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L='| less'
alias -g N='| /dev/null'
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Starts another shell instance and closes the current one.
# Perfect for applying any config changes.
alias es="exec $SHELL"

# PS
alias psa='ps aux'
alias psg='ps aux | grep '
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

alias ae="vim $ywd/zsh/aliases.zsh" #alias edit
alias ar="source $ywd/zsh/aliases.zsh"  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# mimic vim functions
alias :q='exit'


# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gai='git add -i'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias ka9='killall -9'
alias k9='kill -9'

# Zippin
alias gz='tar -zcvf'

# tmux
alias ta='tmux a'
alias tat='tmux a -t'
alias tls='tmux ls'
alias tns='tmux new -s'
alias tkserver='tmux kill-server'
alias tks='tmux kill-session -t'
alias tss='tmux start-server'

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Homebrew
# TODO: move this to an OSX-specific file
alias brewu='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'
alias rake='noglob rake'
alias be='noglob bundle exec'
alias zmv='noglob zmv -W'

# Ruby
alias c='rails c' # Rails 3

# Rails
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'
alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Rspec
alias rs='rspec spec'

# Elixir / Phoenix
alias mdg='mix deps.get'
alias mem='mix ecto.migrate'
alias mec='mix ecto.create'
alias mes='mix ecto.setup'
alias memu='mix ecto.mulligan'
alias meres='mix ecto.reset'
alias mered='mix ecto.redo'
alias med='mix ecto.drop'
alias meroll='mix ecto.rollback'
alias megm='mix ecto.gen.migration'
alias mpgm='mix phoenix.gen.model'
alias mpn='mix phoenix.new'
alias mpr='mix phoenix.routes'
alias mps='mix phoenix.server'
alias mt='mix test'
alias me='mix espec'
alias imps='iex -S mix phoenix.server'
alias im='iex -S mix'

