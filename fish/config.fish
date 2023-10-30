if status is-interactive
    # startup
    starship init fish | source
    atuin init fish | source
    complete -f -c dotnet -a "(dotnet complete (commandline -cp))"
end


set -g fish_prompt_pwd_dir_length 0

# alias

# alias for cd
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias ip='ip -color'

# alias for ls
if command -sq eza
    alias ls='eza --color=always --group-directories-first --icons' # all files and dirs
    alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
    alias ll='eza -lm --color=always --group-directories-first --icons' # long format
    alias lt='eza -T --color=always --group-directories-first --icons' # tree listing
    alias lta='eza -aT --color=always --group-directories-first --icons' # tree listing
    alias l.='eza -a --color=always --group-directories-first --icons  --ignore-glob="[!.]*"' # show only dotfiles
    alias ll.='eza -al --color=always --group-directories-first --icons  --ignore-glob="[!.]*"' # show only dotfiles
end

# alias for sl
if command -sq sl
    alias sl='sl -ceF'
end

# alias for gitui
if command -sq gitui
    alias gui='gitui'
end

# alias for rm
if command -sq rmtrash
    alias rm='rmtrash'
end

# alias for wineprefix
alias wine64='WINEPREFIX=/mnt/disk-a/storage/win-game/wine64'
alias wine32='WINEPREFIX=/mnt/disk-a/storage/win-game/wine32'

# alias for joshuto
alias jo='/home/lemon/.config/joshuto/jo.sh'
alias j=jo

# alias for BBDown
alias bbdown='BBDown --config-file ~/.config/bbdown/BBDown.config'

# alias for neovim
alias nv='nvim'
alias nvid='neovide'

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
