# 
# Aliases for .bashrc
#

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# git
alias gs='git status'
alias gpush='git push origin main'
alias gadd='git add .'
alias gom='git commit -m'
alias glog='git log'
alias gpull='git pull origin main'
alias gcheck='git checkout'
alias gbranch='git branch'
alias grestore='git restore --staged'


# tmux 
alias tls='tmux ls'
alias tas='tmux attach-session'
alias tkill='tmux kill-session'
alias tnew='tmux new -s'
alias tat='tmux a -t'
alias tdetach='tmux detach'


# config files
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias baliases="vim ~/.bash_aliases"
alias vim='/usr/bin/vim'
alias sall='source ~/.bash_aliases && ~/.bashrc && source ~/.vimrc && source ~/.tmux.conf'


# Vim/Neovim things
alias vim="nvim"
alias vvim="vim"


# alias for cpp compilation
alias cpp='g++ -g $@.cc -o $@'


# quarto aliases
alias qr='quarto render'
alias qp='quarto preview' 

# quarto preview
qpre() {
    quarto preview "$1" --to html
}

# alias to open file in chrome
alias chrome='open -a "Google Chrome"'
