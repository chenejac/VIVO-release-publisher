#!/bin/bash
# Vitro script - push release branch to maintenance

ECHO -----------------------------${Vitro_REPO}---------------------------------
ECHO ">>>" git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_REPO}.git
git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_REPO}.git
ECHO ">>>" cd ${Vitro_REPO}
cd ${Vitro_REPO}
ECHO ">>>" git  remote  set-branches  --add  origin  rel-${RC_VERSION}-RC
git  remote  set-branches  --add  origin  rel-${RC_VERSION}-RC
ECHO ">>>" git  fetch  origin
git  fetch  origin
ECHO ">>>" git  checkout  --track  origin/rel-${RC_VERSION}-RC
git  checkout  --track  origin/rel-${RC_VERSION}-RC
ECHO ">>>" git push origin rel-${RC_VERSION}-RC:rel-${RC_VERSION_MINOR}-maint
git push origin rel-${RC_VERSION}-RC:rel-${RC_VERSION_MINOR}-maint
ECHO ">>>" git checkout ${BRANCH}
git checkout ${BRANCH}
ECHO ">>>" git merge heads/rel-${RC_VERSION}-RC
git merge heads/rel-${RC_VERSION}-RC
ECHO ">>>" git push origin ${BRANCH}
git push origin ${BRANCH}
for n in $(seq 1 ${Vitro_RC_NUM})
do
    ECHO ">>>" git push origin :refs/tags/rel-${RC_VERSION}-RC-${n}
    git push origin :refs/tags/rel-${RC_VERSION}-RC-${n}
done
ECHO ">>>" git push origin --delete rel-${RC_VERSION}-RC
git push --delete origin rel-${RC_VERSION}-RC
ECHO ">>>" cd ..
cd ..