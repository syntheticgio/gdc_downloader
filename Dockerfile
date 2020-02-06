FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y install wget python3-dev python3 zip

RUN wget https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.5.0_Ubuntu_x64.zip
RUN unzip gdc-client_v1.5.0_Ubuntu_x64.zip

CMD ["bin", "bash"]