FROM mhart/alpine-node:latest
MAINTAINER Anton Kastritskiy <halloy52@gmail.com>

ENV SWAGGERLINT_VERSION=0.0.3 \
    PATH=/usr/lib/node_modules/.bin:$PATH

RUN npm install -g swaggerlint@${SWAGGERLINT_VERSION} && \
    rm -rf /usr/share/man /tmp/* \
           /root/.npm /root/.node-gyp \
           /usr/lib/node_modules/npm/man \
           /usr/lib/node_modules/npm/doc \
           /usr/lib/node_modules/npm/html && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

CMD /usr/lib/node_modules/.bin/swaggerlint
