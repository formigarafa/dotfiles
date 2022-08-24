alias vim="nvim"
alias git_delete_merged_branches="git branch --merged master --no-color | egrep -v master | grep -v $(git branch --show-current) | xargs git branch -d"

