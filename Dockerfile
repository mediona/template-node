FROM node:18

LABEL org.opencontainers.image.source=https://github.com/giantswarm/${repository-name}
LABEL org.opencontainers.image.description=${repository-description}
LABEL org.opencontainers.image.licenses=Apache-2.0

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . .

# Build the code.
RUN npm run build

# Run the web service on container startup.
CMD [ "node", "dist/server.js" ]
