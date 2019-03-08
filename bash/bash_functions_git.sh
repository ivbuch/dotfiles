# checkout git branch
fgc() {
  local branches branch
  branches=$(git branch -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# checkout git branch all
fg_ca() {
  local branches branch
  branches=$(git branch -a -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# show commit diff
fg_cd() {
  local commits commit
  commits=$(git log --name-status --abbrev-commit) 
  commit=$(echo "$commits" | fzf +m)
  id=$(echo "$commit" | cut -d\  -f2)
  git difftool $id^..$id
  echo $id
}
