FROM ubuntu:xenial

# Try replacing the standard ubuntu archive with a faster mirror
RUN sed -i.bak 's/archive.ubuntu.com/mirrors.rit.edu/' /etc/apt/sources.list

# Install Python3
RUN apt-get update && apt-get install --assume-yes python3

# Install LaTeX
COPY install-texlive-without-docs.py /tmp/
RUN python3 /tmp/install-texlive-without-docs.py

# Set the locale for English, UTF-8
#   see:
#     - https://github.com/rstudio/rmarkdown/issues/383
#     - https://github.com/rocker-org/rocker/issues/19
#     - http://crosbymichael.com/dockerfile-best-practices-take-2.html
RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Install pandoc
RUN apt-get update && apt-get install --assume-yes wget
ENV PANDOC_URL https://github.com/jgm/pandoc/releases/download/1.17.1/pandoc-1.17.1-2-amd64.deb
RUN wget $PANDOC_URL --output-document /tmp/pandoc-package.deb
RUN dpkg --install /tmp/pandoc-package.deb

# Test pandoc
RUN echo "# \`pandoc\` should work *successfully!*" > /tmp/test.md
RUN pandoc -t html /tmp/test.md
