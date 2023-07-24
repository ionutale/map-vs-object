FROM node:20-alpine3.17

ARG ITERATIONS=1000000
ARG TYPE=object
ENV ITERATIONS=${ITERATIONS}
ENV TYPE=${TYPE}
# Create app directory
WORKDIR /app

COPY index.js /app

CMD [ "node", "index.js" ]