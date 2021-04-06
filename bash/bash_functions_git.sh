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

# copy local branch name to system clipboard
.git_copy_local_branch_name() {
  local branches branch

  if ! branches=$(git branch); then
    return
  fi

  pretty=$(echo ${branches} | awk '
  {
    if ($1 == "*" || $1 == "+") {
      print $2
      next
    }
    print $1
  }'
  )
  branch=$(echo "${pretty}" | fzf --no-multi --preview 'git log {}')
  if [ -z ${branch} ]; then 
    echo "no branch selected"
    return 1
  fi 

  echo -n "${branch}" | xclip -i -selection clipboard
  echo "Branch \"${branch}\" copied into clipboard"
}

# pretty print git branch with tracking
.git_branch() {
  branches=$(PAGER=cat git branch -vv)
  if [ -z ${branches} ]; then
    return 1
  fi

  pretty=$(echo ${branches} | awk '
  BEGIN {
    printf("%50-s| %50-s\n", "Branch Name", "Remote branch")
    for (i = 0; i < 100; i++) {
      printf("-")
    }
    print ""
  }
  {
    branch_name = $1
    remote = ""
    if ($1 == "*" || $1 == "+") {
      branch_name = $2
    }
    s = index($0, "[origin/")
    if (s > 0) {
      e = index($0, "]")
      remote = substr($0, s + 1, e - s - 1)
    }
    printf("%50-s| %50-s\n", branch_name, remote)
  }
  '
  )
  echo ${pretty}
}
