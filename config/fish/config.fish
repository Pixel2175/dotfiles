set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hostname always

# aliases
alias wall "python ~/.change_wall.py"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias a="clear && tcc -run main.c"

# Pacman
alias i "doas pacman -S "
alias s "doas pacman -Ss "
alias d "doas pacman -Rns "
alias u "doas pacman -Syu "



if command -q exa
    function ls -w exa
        exa -hg --icons --group-directories-first --color=auto $argv
    end
else
    echo "you need to install exa - https://github.com/ogham/exa#installation"
end



set -Ux VDPAU_DRIVER va_gl


set -gx EDITOR nvim
set -gx BROWSER min
#set -gx PATH bin $PATH
#set -gx PATH ~/bin $PATH
#set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

#switch (uname)
#    case Linux
#        source (dirname (status --current-filename))/config-linux.fish
#end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
