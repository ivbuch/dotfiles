tal() {
  project=$(task projects | sed '1,3d' | head -n -2 | fzf --reverse --tac | awk '{print $1}')
  if [[ "$?" -eq "0" ]]; then
    task project:"$project" list
  fi
} 

taa() {
  echo -n "Enter task name: "
  read -r value
  project=$(task projects | sed '1,3d' | head -n -2 | fzf --reverse --tac)
  if [[ "$?" -eq "0" ]]; then
    project=$(echo "$project" | awk '{print $1}')
    echo Running \"task project:"$project" add "$value"\"
    task project:"$project" add "$value"
  fi
} 
