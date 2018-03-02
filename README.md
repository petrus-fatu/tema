# Tema pentru Proba Qualitance

Necessary files and instruction to deploy the 3 apps via docker-compose. I've included the app code itself, as well as the deployment code.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine. An automated setup script [install.sh] has been provided for red-hat based linux systems but this will work on any platform that supports docker-compose.

### Prerequisites

There are 3 main requirements to get these apps up and running:

```
git
docker
docker-compose
```
The last 2 are installed automatically by the script. If you're not using that, then make sure all 3 dependencies are up and running before continuing.

### Installing

Use the following command to get the source code.

```
git clone https://github.com/Andrei-Safta/tema.git
```

If you're running a red-hat/centos based linux distro, simply run **./install.sh** to get the containers up and running. Otherwise follow the steps below:


1. Start docker if the service is not already running.
2. Run the following command **mkdir -p /var/log/container/{java,node,python}** to set up directories needed later
3. From the project directory, run **docker-compose -p tema up -d** in order to start the applications
4. Run *cd docker-elk* and then **docker-compose up -d** to start the ELK stack for monitoring

## Running the apps


### Load-balanced applications

You can now access [http://127.0.0.1](http://127.0.0.1) in order to access the load balancer. Refresh several times, and you'll see it switches between serving the node, java and python apps in turn. Note: the java application may require a few seconds before it goes online.


### ELK stack

Access [http://127.0.0.1:5601](http://127.0.0.1:5601) in order to reach the Kibana interface.

Please note: the containers are set up to output their logs to /var/log/container/ on the host machine, and the ELK stack is prepared to pick them up. However the apps as they are right now don't output any logs to files.

Assuming they did, do the following to ingest logs:

1. Modify the logstash configuration found in docker-compose/logstash/pipeline/logstash.conf to add the data sources. Reference on how to do so found [here](https://www.elastic.co/guide/en/logstash/current/logstash-config-for-filebeat-modules.html#parsing-nginx).
2. go to the docker-elk directory and run **docker-compose restart**.
3. Access Kibana, go to Management, and start adding index patterns. More info on that [here](https://www.elastic.co/guide/en/kibana/current/index-patterns.html).

## References

Docker ELK stack code obtained and modified from here:

[https://github.com/deviantony/docker-elk](https://github.com/deviantony/docker-elk)

Acknowledgement and credit for its creation to [Anthony Lapenna](https://github.com/deviantony)
