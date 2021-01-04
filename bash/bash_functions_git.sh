# checkout git branch
.gitf_checkout() {
  local branches branch
  branches=$(git branch -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# checkout git branch all
.gitf_checkout_all() {
  local branches branch
  branches=$(git branch -a -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# show commit diff
.gitf_commit_diff() {
  local commits commit
  commits=$(git log --name-status --abbrev-commit) 
  commit=$(echo "$commits" | fzf +m)
  id=$(echo "$commit" | cut -d\  -f2)
  git difftool $id^..$id
  echo $id
}

# dump branch
.gitf_branch_dump() {
  local branches branch

  if ! branches=$(git branch); then
    return
  fi

  branch=$(echo "$branches" | fzf --exact +m | xargs)
  
  if [ -n "$branch" ]; then
    new_branch="___${branch}"
    git branch --move "$branch" "${new_branch}"
    echo "Moved ${branch} to ${new_branch}"
  fi
}
