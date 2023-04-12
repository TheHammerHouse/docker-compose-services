# HammerHouseAuctions Instructions
This README file provides instructions on how to run the project. There are two options available depending on whether you have bash installed on your system or not.

## Option 1: Bash Installed

If you have bash installed on your system, running the project is straightforward. Simply execute the following command from the project root directory of the DockerServices folder:

```bash initializeContainers.sh```

The script will automatically detect your architecture and build the Docker images accordingly.

## Option 2: Bash Not Installed

If bash is not installed on your system, you need to determine the architecture of your machine. We have developed two different docker-compose files for this purpose: one for ARM and one for x64.

If your architecture is ARM, then execute the following command from the project root directory of the DockerServices folder:

```docker-compose -f docker-compose_arm.yml up -d --build --force-recreate```

If your architecture is x64, then execute the following command from the project root directory of the DockerServices folder:

```docker-compose -f docker-compose_intel.yml up -d --build --force-recreate```

## What next?
That's it! Once the Docker containers are up and running, you can access the project using your web browser by navigating to the following url. 

```http://localhost:3000/```

If you have any questions or encounter any issues while running the project, please feel free to contact us.
