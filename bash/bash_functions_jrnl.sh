# JRNL
alias j="jrnl"

ja() {
  jrnl --export markdown | glow - -p 
}

# by tags
jt() {
  jrnl "$1" --export markdown | glow - -p 
}


# edit journal
je() {
  vim ~/.config/jrnl/journals/journal.txt
}
