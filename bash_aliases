alias vim="nvim"
alias git_delete_merged_branches='git branch --merged master --no-color | egrep -v master | grep -v $(git branch --show-current) | xargs git branch -d'
alias changed_rb_files="git diff --name-only master --diff-filter=d | egrep '(\.rb|\.rake|Gemfile)$'"
alias changed_rspec_files="git diff --name-only master --diff-filter=d | egrep '_spec.rb$'"
alias rubocop_changes="changed_rb_files | xargs rubocop"
alias rspec_changes="changed_rspec_files | xargs rspec"
alias tswitch="sh -c '(tmux list-sessions -F \"#S\" 2> /dev/null | grep \$0 > /dev/null || tmux new -s \$0 -c ~/projects/\$0 -d) && ( tmux switch -t \$0 2> /dev/null || tmux a -t \$0 )'"
alias last_git_tag="git describe --tags --abbrev=0"
alias next_git_tag="git describe --tags --abbrev=0 | perl -pe 's/^((\\d+\\.)*)(\\d+)(.*)\$/\$1.(\$3+1).\$4/e'"

