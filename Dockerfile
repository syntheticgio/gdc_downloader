FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y install wget python3-dev python3 zip

RUN wget https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.5.0_Ubuntu_x64.zip
RUN unzip gdc-client_v1.5.0_Ubuntu_x64.zip

RUN mkdir data

### To run:
### Run docker container with volume mount to where you have the token file and the manifest
### enter for the token -t <file path within docker container> and for the manifest -m <file within the docker container>
### In the alternative to the manifest you can put the TCGA ID
###
### Examples if docker container is called gdc-downloader:latest
###
### If you are running with a volume mount from the /data directory into the /data directory in the container
### docker run -v /data:/data -t gdc-downloader:latest -t /data/token.pem -m /data/manifest.txt -d /data
###
### If you are running on a single TCGA ID
###
### docker run -v /data:/data -t gdc-downloader:latest -t /data/token.pem TCGA-1A54 -d /data

### NOTE: An output directory needs to be set (-d <dir> and a -v volume mount) or else it will download into the ephemeral container!!

ENTRYPOINT ["./gdc-client", "download", "--log-file", "/data/log_file.txt", "--color_off"]
CMD ["--help"]
# -t token file, -m manifest