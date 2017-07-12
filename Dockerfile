FROM pritunl/archlinux:2017-07-01

LABEL "maintainer"="Rust Bangalore Community, rustox@googlegroups.com"

ARG P01=cargo
ARG P02=rust
ARG P03=rust-docs
ARG P04=rustfmt
ARG P05=rust-racer
ARG P06=uncrustify
ARG P07=vi
ARG P08=nano
ARG P09=elinks
ARG P10=git
ARG P11=tree

ARG USER=rustox
ARG PASS=rustox

RUN /usr/bin/pacman --sync --noconfirm $P01 $P02 $P03 $P04 $P05 $P06 $P07 $P08 $P09 $P10 $P11

RUN /usr/bin/useradd --create-home --groups wheel $USER

RUN /usr/bin/echo $USER:$PASS | /usr/bin/chpasswd

RUN mkdir -p rustox/book/
ADD rpl2edn.tar.gz /home/$USER/rustox/book/

ADD readme.txt /home/$USER/

WORKDIR /home/$USER

CMD ["/usr/bin/bash", "-c", "su - rustox"]

