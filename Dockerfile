#  Copyright 2019 IBM
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM node:alpine
LABEL maintainer="dwakeman@us.ibm.com"

WORKDIR /home/node/app

# Install the application
COPY package*.json ./
RUN npm install

# Support to for arbitrary UserIds
# https://docs.openshift.com/container-platform/3.11/creating_images/guidelines.html#openshift-specific-guidelines
RUN chmod -R u+x /home/node/app && \
    chgrp -R 0 /home/node/app && \
    chmod -R g=u /home/node/app /etc/passwd

# Copy the rest of the application content into the image
ADD server ./server
ADD public ./public

# Using the "node" user provided in the node base image
USER node

# Define and expose the port on which the app will listen for requests
ENV PORT 8080
EXPOSE 8080

# Define command to run the application when the container starts
CMD ["node", "server/server.js"]