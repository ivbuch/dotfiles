journal_file="/my-tools/home-infostructure/dotfiles/journal/journal.md"

ja() {
  grip "$journal_file" 9090 &
  firefox localhost:9090
}

# edit journal
je() {
  vim $journal_file
}
