#!/bin/bash
#Check for the touch file and exit early if it exists (that means this has already run)
echo "Starting the once-run"
if [ -f /etc/opt/grafana_setup_run.touch ]; then
    echo "Already been run; exiting"
    exit 1
fi
echo "Running the user's script"
if [ -z "$DOCKER_SECRET_NAME" ]
then
  echo "Executing /opt/grafana_run_once.sh"
  sh /opt/grafana_run_once.sh
else
  echo "Executing /run/secrets/$DOCKER_SECRET_NAME"
  sh /run/secrets/$DOCKER_SECRET_NAME
fi
echo "Done running the user's script; exiting"
#Prevent this from running again
touch /etc/opt/grafana_setup_run.touch

exit 1
