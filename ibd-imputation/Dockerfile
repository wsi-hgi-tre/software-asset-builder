FROM debian:bullseye

RUN apt update \
 && apt install -y \
      build-essential \
      cmake \
      curl

# Download and build zlib (so we have a static lib)
RUN curl http://zlib.net/zlib-1.2.11.tar.gz | tar xz \
 && cd /zlib-1.2.11 \
 && ./configure \
 && make \
 && make install

# Patch and compile code, then build package
ADD IBD_Imputation.tar.gz hgi.patch control /working/
RUN cd /working \
 && mkdir -p build \
             ibd-imputation/DEBIAN \
             ibd-imputation/usr/bin \
 && patch -ruN -p1 -d IBD_Imputation < hgi.patch \
 && cd build \
 && cmake -DCMAKE_EXE_LINKER_FLAGS="-static" \
          -DCMAKE_BUILD_TYPE=MinSizeRel \
          ../IBD_Imputation/Code \
 && make \
 && cd .. \
 && mv control ibd-imputation/DEBIAN \
 && mv build/exe/fastsmc-imputation ibd-imputation/usr/bin \
 && dpkg-deb --build ibd-imputation
