gum log --structured --level info "Setup Git..."
echo ''

GIT_USERNAME=$(gum input --placeholder "What is your preferred user name for Git?")
GIT_EMAIL=$(gum input --placeholder "What is your preferred email address for Git?")

git config --global pull.rebase true
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
