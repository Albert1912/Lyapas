FROM ubuntu:18.04 as build
WORKDIR /
RUN apt-get update
RUN apt-get install -y nasm
RUN apt-get install -y binutils
RUN apt-get install -y make
COPY . .

RUN cd Lyapas2.0 && mkdir obj && mkdir build && make

FROM ubuntu:18.04 as final
WORKDIR /
COPY --from=build . .
#ENTRYPOINT ls Lyapas2.0/obj
ENTRYPOINT ./Lyapas2.0/build/lyapas Lyapas2.0/file.txt