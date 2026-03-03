
if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
  alias l='eza --icons -l --group-directories-first'
  alias la='eza --icons -al --group-directories-first'
  alias ll='eza --icons -l --group-directories-first'
else
  alias ls='ls -F --color=auto'
  alias l='ls -ltr'
  alias la='ls -la'
  alias ll='ls -l'
fi

if command -v delta >/dev/null 2>&1; then
  alias diff='delta'
else
  alias diff='git diff --color=auto'
fi

if command -v fd >/dev/null 2>&1; then
  alias find='fd'
else
  alias find='find'
fi


alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'


alias grep='grep --color=auto'
alias his='history -E -i 1 | fzf'
