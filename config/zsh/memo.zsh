# Finally my simple memo

if [ ! -f ~/.memo.md ]; then
  if [ -f ~/.memo ]; then
    # Upgrading old memo format
    mv ~/.memo ~/.memo.md
  else
    # Creating a new memo
    touch ~/.memo.md
  fi
fi

if [ ! -f ~/.go/bin/glow ]; then
  echo "Glow not found"
  echo "Install it with: `go install github.com/charmbracelet/glow@latest`"
else
  ~/.go/bin/glow -s dark ~/.memo.md
fi

alias m="~/.go/bin/glow -s dark ~/.memo.md"
alias memo="vim ~/.memo.md"
