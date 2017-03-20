#!/bin/bash
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASSWORD

if [ ! -z "$TRAVIS_TAG" ]
then
  docker tag $DOCKER_REPO:latest $DOCKER_REPO:$TRAVIS_TAG
  docker push $DOCKER_REPO:$TRAVIS_TAG
fi

if [ "$TRAVIS_BRANCH" == "master" ]
then
  docker tag $DOCKER_REPO:latest $DOCKER_REPO:latest
  docker push $DOCKER_REPO:latest
fi
