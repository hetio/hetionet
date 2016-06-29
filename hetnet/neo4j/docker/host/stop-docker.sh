# Stop Docker containers of the dhimmel/hetionet image
docker rm $(docker stop $(docker ps --all --quiet --filter ancestor=dhimmel/hetionet --format="{{.ID}}"))
