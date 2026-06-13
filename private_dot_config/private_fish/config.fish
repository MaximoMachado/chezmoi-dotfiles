if status is-interactive

    # If starship is file/binary/function
    if type -q starship
        starship init fish | source
    end

    if type -q zellij;  and alias zel="zellij"; end
    if type -q lsd;     and alias ls="lsd -l"; end
    if type -q duf;     and alias df="duf"; end
    if type -q fdfind;  and alias fd="fdfind"; end
    if type -q rg;      and alias rg="rg -S"; end

    if type -q nvim
        set --global --export EDITOR nvim
        alias vim="nvim"
    else
        set -gx EDITOR vim
    end

    if test -f $HOME/.ssh/golden-finch 
        ssh-add $HOME/.ssh/golden-finch
    end

    # opencode
    fish_add_path $HOME/.opencode/bin
    fish_add_path /usr/local/cuda/bin
    fish_add_path $HOME/build/llama.cpp/build/bin

    set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH

    # If path to brew bin exists, then source needed ENV vars
    if test -f /home/linuxbrew/.linuxbrew/bin/brew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
    end

    source $HOME/.global_pyvenv/bin/activate.fish
end # is-interactive

# Test if directory
if test -d $HOME/.pixi/bin
    set --global --export PATH "$HOME/.pixi/bin" $PATH
end

