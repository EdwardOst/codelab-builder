FROM ubuntu as ClaatExporter

# get the claat binaries
RUN apt-get update \
 && apt-get install -y wget \
 && wget https://github.com/googlecodelabs/tools/releases/download/v2.2.6/claat-linux-amd64 -O /claat \
 && chmod u+x /claat

# use claat to generate the site from the md submitted in the docs folder of the host
WORKDIR /app
COPY docs/ input/
RUN  /claat export -o output input/**/*.md


FROM ubuntu as AppBuilder

# install pre-reqs: git, nod, npm, python, gcc
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y git nodejs npm make python3 gcc g++ \
 && npm install -g gulp-cli \
 && npm config set python /usr/bin/python3

# clone codelab tools
WORKDIR /app
RUN git clone -b main https://github.com/googlecodelabs/tools.git codelabs-tools

# install the codelab site node dependencies
WORKDIR /app/codelabs-tools/site
RUN npm install && npm install gulp

# get claat output from previous stage
WORKDIR /app/codelabs-tools/site
COPY --from=ClaatExporter /app/output codelabs/

# Build everything
RUN gulp dist --codelabs-dir=codelabs --base-url="talend"

# Replace symlink in with actual content (see below for description)
WORKDIR /app/codelabs-tools/site/dist
RUN rm codelabs
# this looks redundant with previous copy-from but the first one is used as input by gulp
# this is used in runtime dist
COPY --from=ClaatExporter /app/output codelabs/


FROM nginx as Deployment
COPY --from=AppBuilder /app/codelabs-tools/site/dist/ /usr/share/nginx/html
EXPOSE 80
