#!/bin/bash

docker stop netflix
docker rm netflix
docker image rm boatengkwasi1991/netflix-react-app:latest 