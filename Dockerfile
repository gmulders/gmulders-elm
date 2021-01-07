FROM node 

ARG UGLIFYJS_VERSION=3.12.4
ARG ELM_TEST_VERSION=0.19.1

# Download and install Elm
RUN wget -c https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz -O /usr/bin/elm.gz && gunzip /usr/bin/elm.gz && chmod a+x /usr/bin/elm

RUN mkdir /tmp/npm

# Install additional Elm tools
RUN npm config set prefix /tmp/npm/.local && npm install --global --unsafe-perm uglify-js@${UGLIFY_VERSION} elm-test@${ELM_TEST_VERSION}

ENV PATH="/tmp/npm/.local/bin:${PATH}"
