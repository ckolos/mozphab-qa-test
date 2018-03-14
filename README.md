A simple mozphab qa container
# Requirements:
  * an account on bugzilla-dev.allizom.org
  * an account on phabricator-dev.allizom.org
  * permissions to commit to the relevant repositories

# Instructions for use:
## Pull this image from dockerhub
```
docker pull ckolos/mozphab-qa-test
```
## Create an env file in the following format:
```
cat << EOF >>env.txt
libhash=<hash of libphutil shown at https://<phabricator instance>/__version__>
archash=<hash of arcanist shown at https://<phabricator instance>/__version__>
EOF
```
## Execute the docker container as below:
```
docker run --it --rm --env-file env.txt ckolos/mozphab-qa-test:latest 
```
## Continue with qa testing as directed
