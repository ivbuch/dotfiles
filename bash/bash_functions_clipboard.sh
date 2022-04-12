# copy filename full path to clipboard
c_ap() {
  filename=$(readlink -f "$1")
  echo "$filename" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$filename' to clipboard"
}

# copy filename to clipboard
c_fn() {
  fn=$(basename "$(readlink -f "$1")")
  echo "$fn" | tr -d '[:space:]'| xclip -i -selection clipboard
  echo "Copied '$fn' to clipboard"
}

c_ip() {
  # Copies ip address to clipboard
  i="$(ip -4 route get 8.8.8.8 | awk "{'print $7'}" | tr -d '\n')"
  echo -n "$i" | xclip -selection clipboard
  echo "IP $i copied to clipboard"
}

### .copy !!! copy stdin into clipboard
.copy() {
  xclip -selection clipboard
}
