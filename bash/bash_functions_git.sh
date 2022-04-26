### .git_gc !!! clean up local repo
.git_gc() {
  git gc
  git fsck
}

### .gitf_checkout !!! checkout git branch
.gitf_checkout() {
  local branches branch
  branches=$(git branch -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

### .gitf_checkout_all !!! checkout git branch all
.gitf_checkout_all() {
  local branches branch
  branches=$(git branch -a -vv) 
  branch=$(echo "$branches" | fzf +m)
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

### .gitf_commit_diff !!! show commit diff
.gitf_commit_diff() {
  local commits commit
  commits=$(git log --name-status --abbrev-commit) 
  commit=$(echo "$commits" | fzf +m)
  id=$(echo "$commit" | cut -d\  -f2)
  git difftool $id^..$id
  echo $id
}

### .gitf_branch_dump !!! dump branch
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

### .gbc !!! copy local branch name
.gbc() {
  .git_copy_local_branch_name
}

### .gb !!! pretty print git branch with tracking
.gb() {
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
    if (branch_name == "staging" || branch_name == "master") {
      next
    }
    remote = ""
    if ($1 == "*" || $1 == "+") {
      branch_name = $2
    }

    s = index(branch_name, "___")
    if (s > 0) {
      next
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

### .gsf !!! git status -> select modified files
.gsf() {
  text=$(git status . -sb | sed '/##/ d')
  selected=$(echo "${text}" | fzf --multi)
  if [ -z "${selected}" ]; then
    return 1;
  fi

  names=$(echo "${selected}" | awk '
  { names = names "  " $2 }
  END {
    print names
  }')
  echo -n "${names}" | xclip -i -selection clipboard
}

### .glf !!! copy commit id from history to clipboard
.glf() {
  text=$(git log --pretty=format:"%h!!!%an!!!%s!!!%cs!!!%d")
  commit=$(echo "${text}" | awk '
    {
      split($0, fields, "!!!")
      commit = fields[1]
      author = fields[2]
      message = fields[3]
      commit_date = fields[4]
      ref = substr(fields[5], 1, 30)

      printf("%-8s  %8s  %20s  %30s  %s\n", commit, commit_date, author, ref, message)
    }' | fzf --reverse)

  if [ -z "${commit}" ]; then
    return 1
  fi
  echo -n "${commit}" | awk '{ print $1 }' | tr -d '\n' | xclip -i -selection clipboard
}

### .gcb !!! copy current branch name into clipboard
.gcb() {
  if ! text=$(git status); then
    echo bad
    return 1 
  fi
  branch_name=$(echo "${text}" -n | head -n 1 | awk '{ print substr($0, length("on branch ") + 1)}')
  echo -n "${branch_name}" | xclip -i -selection clipboard
  echo "Branch name '${branch_name}' copied into clipboard"
}

### .gh-jenkins !!! open PR jenkins link in browser
.gh-jenkins() {
  url="$(gh pr checks | grep_ 'sysdig-jenkins' | sed 's|.*\(https://sysdig-jenkins.*\)|\1|')"
  echo "Captured ${url}"
  updated_url="$(echo "${url}" | sed 's|display/redirect|console|')"
  echo "Updated ${updated_url}"
  firefox "${updated_url}"
  bspc desktop -f 5
}

### .gh-pr-web !!! open PR in web
.gh-pr-web() {
  BROWSER=firefox gh pr view --web
}
