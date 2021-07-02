FROM debian:buster

RUN printf "deb http://deb.debian.org/debian %s main\n" \
      "buster-backports" \
      "testing" \
      >> /etc/apt/sources.list \
 && apt update \
 && apt install -y \
      build-essential \
      cmake/buster-backports \
      zlib1g-dev

# Compile code and build package
ADD IBD_Imputation.tar.gz control /working
RUN cd /working \
 && mkdir -p build \
             ibd-imputation/DEBIAN \
             ibd-imputation/usr/bin \
 && cd build \
 && cmake ../IBD_Imputation/Code \
 && make \
 && cd .. \
 && mv control ibd-imputation/DEBIAN \
 && mv build/exe/fastsmc-imputation ibd-imputation/usr/bin \
 && dpkg-deb --build ibd-imputation
