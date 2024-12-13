echo ':small_orange_diamond: Setup {{ Bold "Git" }}' | gum format -t template | gum format -t emoji
echo ''

GIT_USERNAME=$(gum input --placeholder "What is your preferred user name for Git?")
GIT_EMAIL=$(gum input --placeholder "What is your preferred email address for Git?")

git config --global pull.rebase true
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
