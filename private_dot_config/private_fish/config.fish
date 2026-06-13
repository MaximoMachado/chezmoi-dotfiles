if status is-interactive
    
    # Remove default greeting
    set fish_greeting

    # If starship is file/binary/function
    if type -q starship
        starship init fish | source
    end


    # Replace common basic shell cmds with better alternatives if installed
    if type -q lsd;     and abbr -a ls "lsd -l"; end
    if type -q duf;     and abbr -a df "duf"; end
    if type -q fdfind;  and abbr -a fd "fdfind"; end
    if type -q zellij;  and abbr -a zel "zellij"; end
    if type -q rg;      and abbr -a rg "rg -S"; end

    if type -q nvim
        set --global --export EDITOR nvim
        abbr -a vim "nvim"
    else
        set -gx EDITOR vim
    end

    # Make interactive (aka won't silently overwrite)
    abbr -a mv 'mv -i'
    abbr -a cp 'cp -i'
    abbr -a rm 'rm -I'
    
    # Git aliases
    abbr -a gs "git status"
    abbr -a gco "git commit -m"
    abbr -a gau "git add -u"
    abbr -a gaa "git add -A"
    abbr -a glog "git log --graph --oneline --decorate --color --all"

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

