# TODO: possibly make these overridable
CODE_DIR=$HOME/code
CODE_EDITOR='code'

alias sz="source ~/.zshrc"
alias sza="source ~/aliases.zsh"

alias pn=pnpm
alias server:start="pas || npmrd"

# list of git projects
code-project-ls() {
  find $CODE_DIR -maxdepth 2 -mindepth 2 -type d -print
  find $CODE_DIR -maxdepth 2 -type f -name "*.code-workspace" -print
  echo ~/dotfiles
}
alias lsprodir="code-project-ls"

# open git proj with VS Code using fzf
code-project-open() {
  QUERY="$*"
  PROJ_DIR=`lsprodir | fzf -1 -0 --query ${QUERY:-''}`

  if [[ $PROJ_DIR ]] then
    echo "Opening $PROJ_DIR - Please wait..."
    $CODE_EDITOR $PROJ_DIR
  else
    echo "ERROR: No Project found for query '$QUERY'"
  fi
}
alias cpro="code-project-open"

# Laravel
alias spinal-tap="composer update taxassistuk/laravel-spine"
alias pa="php artisan"
alias pai="(cd gcs && php artisan db:import)"
alias tinker="php artisan tinker"

# Git
# alias gdone="g dev && gl && gbD $1 && git push -d origin $1"
alias lg="lazygit"
alias appraisal-gen="git log --pretty=format:'* %s' --since="6 months" --committer="ruddock" --grep="Merge" --invert-grep"

# dotfiles repo
DOT_DIR="$HOME/dotfiles"
alias dt='f() { git -C "$DOT_DIR" "$@" }; f'
alias dta='f() { dt add "$@" }; f'
alias dtc='f() { dt commit "$@" }; f'
alias dts='f() {( cd "$DOT_DIR" && stow */ "$@" )}; f'
alias dti='f() {( zsh "$DOT_DIR/init" )}; f'
alias dtst="dt status"
alias dtp="dt push"
alias dtl="dt pull"
alias dtlol="dt log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\""
alias dtcode="$CODE_EDITOR $DOT_DIR"
alias dtf="dtcode"

# Supabase
alias sb="supabase"
alias sbs="supabase start -x vector"
alias sbst="supabase status"
alias sbsa="sba start -x vector"
alias sbt="supabase db test"
alias sbr="supabase db reset"
sba() {
  find $CODE_DIR -maxdepth 3 -name "supabase" -type d -exec zsh -c "cd {} && supabase $*" \;
}
sbu() {
  sba "supabase stop --no-backup"
  brew upgrade supabase
  sbsa
}
sbm() { # create migration
  name=$1
  if [[ -z $name ]] then
    name=`git rev-parse --abbrev-ref HEAD`
  fi
  name=$(echo $name | tr '-' '_')
  supabase db diff -f $name
}

# Turbo
alias tu="turbo"
alias turd="turbo run dev"
alias tut="turbo run test"
alias tutu="turbo run test:unit"
alias tutb="turbo run test:browser"
alias tudbr="turbo db:reset"

boop () {
  local last="$?"
  if [[ "$last" == '0' ]]; then
    sfx good
  else
    sfx bad
  fi
  $(exit "$last")
}