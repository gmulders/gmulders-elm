FROM node 

RUN wget -c https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz -O /usr/bin/elm.gz && gunzip /usr/bin/elm.gz && chmod a+x /usr/bin/elm
RUN npm install --global uglify

ENTRYPOINT [ "/bin/bash" ]