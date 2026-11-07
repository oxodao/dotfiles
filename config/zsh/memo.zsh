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

if command -v glow >/dev/null 2>&1; then
  glow -s dark ~/.memo.md
else
  echo "Glow not found"
  echo "Install it with your package manager"
fi


alias m="~/.go/bin/glow -s dark ~/.memo.md"
alias memo="vim ~/.memo.md"
