#!/bin/bash
set -e

EMAIL="$1"
read -r -s -p "Enter password: " password
out="mail-account-password"

echo "Generate mutt password file"

echo "set imap_pass=\"$password\"" > "$out"
echo "set smtp_pass=\"$password\"" >> "$out"

gpg -r "$EMAIL" -e "$out"
mv -v "${out}.gpg" "$HOME/.mutt"
rm "$out"
