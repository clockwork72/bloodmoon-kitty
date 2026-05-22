# Colorful shell on remote hosts. Sourced from ~/.bashrc on toubkal.
# Sourced by both bash and zsh; keep POSIX-friendly.

# Try dircolors first; fall back to a bundled LS_COLORS if the system db is
# empty (common on minimal HPC base images).
if command -v dircolors >/dev/null 2>&1; then
    if [ -r "$HOME/.dircolors" ]; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi
fi
if [ -z "$LS_COLORS" ] || [ "$LS_COLORS" = "" ]; then
    export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.pdf=00;33:*.epub=00;33:*.txt=00:*.md=00:*.markdown=00:*.html=01;33:*.htm=01;33:*.xml=01;33:*.css=01;33:*.json=01;33:*.yaml=01;33:*.yml=01;33:*.toml=01;33:*.c=01;37:*.h=01;37:*.cpp=01;37:*.cc=01;37:*.cxx=01;37:*.hpp=01;37:*.py=01;33:*.pyc=00;90:*.js=01;33:*.ts=01;33:*.go=01;33:*.rs=01;33:*.rb=01;33:*.java=01;33:*.sh=01;32:*.bash=01;32:*.zsh=01;32:*.fish=01;32:*Makefile=01;33:*Dockerfile=01;33:*.log=00;90:*.bak=00;90:*.swp=00;90:*~=00;90:'
fi

# Color-aware aliases.
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Man pages: red headers / blue links via less termcap overrides.
export LESS_TERMCAP_mb=$'\e[1;31m'    # blink   -> bold red
export LESS_TERMCAP_md=$'\e[1;31m'    # bold    -> bold red
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;41m' # standout -> yellow on red (search hits)
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;36m'    # underline -> cyan

# Force colors for tools that auto-detect.
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'
export CLICOLOR=1

# Prompt — only set if user has no PS1 customization already (bash only).
# Comment this block out if it clashes with a cluster-managed prompt.
if [ -n "$BASH_VERSION" ] && [ "${PS1#*\\\[}" = "$PS1" ]; then
    PS1='\[\e[38;5;196m\][\u@\h\[\e[0m\] \[\e[38;5;208m\]\w\[\e[38;5;196m\]]\$\[\e[0m\] '
fi
