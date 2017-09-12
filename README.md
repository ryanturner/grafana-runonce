# grafana-runonce
This runs grafana with an additional one-time-only user-defined script. That way, you can make API calls to setup your datasource, dashboards, etc on the first run of your container. It is based on the official Grafana image. Note that it waits 60 seconds before running your custom script in order to make sure that grafana is fully ready before execution.

## Example use
```
docker run -v ~/workspace/grafana-runonce/run_once_sample.sh:/opt/grafana_run_once.sh -p "3000:3000" -it k0ret/grafana-runonce:latest
```
Alternatively, if your runonce has secrets in it and you're using docker swarm, you can use secrets! Make sure to set ENV DOCKER_SECRET_NAME with the name of your secret, and it will read from there.

## License
See LICENSE file.
