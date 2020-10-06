FROM node 

ARG UGLIFY_VERSION=0.1.5
ARG ELM_TEST_VERSION=0.19.1

# Download and install Elm
RUN wget -c https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz -O /usr/bin/elm.gz && gunzip /usr/bin/elm.gz && chmod a+x /usr/bin/elm

# Create an Elm user
RUN addgroup --gid 3435 --system elm && adduser --home /home/elm --shell /bin/bash --gid 3435 --system --disabled-password --uid 3435 elm

USER elm
WORKDIR /home/elm

# Install additional Elm tools
RUN npm config set prefix /home/elm/.local && npm install --global uglify@${UGLIFY_VERSION} elm-test@${ELM_TEST_VERSION}

# Make available Elm tools available on the path
COPY .bashrc .bashrc

ENTRYPOINT [ "/bin/bash" ]