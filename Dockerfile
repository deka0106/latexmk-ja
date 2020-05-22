# Copyright 2020 Deka
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes
ENV PATH /usr/local/texlive/2020/bin/x86_64-linux:$PATH

RUN apt-get update \
    && apt-get -y install \
    build-essential \
    curl \
    wget \
    git \
    libfontconfig1-dev \
    libfreetype6-dev \
    ghostscript \
    perl \
    python3-pip \
    python3-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install pygments \
    && mkdir /tmp/install-tl-unx \
    && wget -O - ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz \
    | tar -xzv -C /tmp/install-tl-unx --strip-components=1 \
    && /bin/echo -e 'selected_scheme scheme-basic\ntlpdbopt_install_docfiles 0\ntlpdbopt_install_srcfiles 0' \
    > /tmp/install-tl-unx/texlive.profile \
    && /tmp/install-tl-unx/install-tl \
    --profile /tmp/install-tl-unx/texlive.profile \
    && tlmgr update --self \
    && tlmgr install \
    collection-bibtexextra \
    collection-fontsrecommended \
    collection-langenglish \
    collection-langjapanese \
    collection-latexextra \
    collection-latexrecommended \
    collection-luatex \
    collection-mathscience \
    collection-plaingeneric \
    collection-xetex \
    latexmk \
    latexdiff \
    latexindent \
    && rm -r /tmp/install-tl-unx \
    && curl -L http://cpanmin.us | perl - App::cpanminus \
    && cpanm \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString \
    Log::Log4perl \
    Log::Dispatch

WORKDIR /workdir

CMD ["bash"]