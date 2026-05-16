if status is-interactive
# Commands to run in interactive sessions can go here
if type -q lsd
    starship init fish | source
end

alias zel="zellij"

if type -q lsd
    alias ls="lsd -l"
end

if type -q fdfind
    alias fd="fdfind"
end

if type -q nvim
    set -gx EDITOR nvim
    alias vim="nvim"
else
    set -gx EDITOR vim
end

ssh-add $HOME/.ssh/golden-finch

# opencode
fish_add_path $HOME/.opencode/bin
fish_add_path /usr/local/cuda/bin
fish_add_path $HOME/build/llama.cpp/build/bin

set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH

# If path to brew bin exists, then source needed ENV vars
if test -f /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
end

end # is-interactive

set -gx PATH "/home/maximo/.pixi/bin" $PATH

