if [ "${CI}" == "true" ]; then

set -e

cat << EOL >> ~/.ssh/config

Host bitbucket.org
IdentitiesOnly yes
IdentityFile /home/ubuntu/.ssh/id_circleci_github
EOL

git remote add bitbucket `git remote get-url origin | sed 's/github.com/bitbucket.org/'`
git fetch origin --prune
for tag in `git tag` ; do git tag -d $tag ; done
git fetch origin --tags --prune
for branch in `git branch -a | grep remotes/origin | grep -v HEAD | grep -v master` ; do
  git branch --track ${branch#remotes/origin/} $branch || true
done
git push bitbucket --mirror --prune --follow-tags
git push bitbucket --mirror --prune --follow-tags

fi
