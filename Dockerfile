
# Update and Download Node.js on Ubuntu base image.
#FROM ubuntu:latest


# Update and install curl in a single step to avoid caching issues
#RUN apt-get update 
#RUN apt-get install curl
# Add Node.js repository
#RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# Upgrade the packages
#RUN apt-get install -y npm
#RUN apt-get install -y nodejs
#RUN apt-get upgrade -y

# Copying the project file and dependences into docker file with same name as files in our system.
# file-on-system  file-on-docker-file
#COPY package.json package.json 
#COPY package-lock.json package-lock.json
#COPY main.js main.js

# This command will run on docker image and generate node modules.
#RUN npm install 

#ENTRYPOINT ["node","main.js"]   }

# stage 1 Compile and dependency stage 

# Use Alpine Linux as the base image
FROM alpine:latest as Build

# Set the DEBIAN_FRONTEND to noninteractive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apk add --no-cache curl nodejs npm

# Set ing the working directory
WORKDIR /app

# Copying project files and dependencies into the Docker image
COPY package.json package.json 
COPY package-lock.json package-lock.json

# Install node modules
RUN npm install

#COPY main.js main.js

#  Stage 2 Runner stage 
From node as runner

WORKDIR /app

copy --from=build app/ .

# Default command to run your application
CMD ["node", "main.js"]
