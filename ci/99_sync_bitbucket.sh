if [ "${CI}" == "true" ]; then

cat << EOL >> ~/.ssh/config

Host bitbucket.org
IdentitiesOnly yes
IdentityFile /home/ubuntu/.ssh/id_circleci_github
EOL

git remote add bitbucket `git remote get-url origin | sed 's/github.com/bitbucket.org/'`
git remote prune origin 
git push bitbucket -f --all
git push bitbucket --tags
git remote prune bitbucket

fi
