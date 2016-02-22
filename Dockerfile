FROM ubuntu:xenial

# Try replacing the standard ubuntu archive with a faster mirror
RUN sed -i.bak 's/archive.ubuntu.com/mirrors.rit.edu/' /etc/apt/sources.list

# Install LaTeX
#   This package list was generated by running
#   `apt-cache depends texlive-full` and then excluding *-doc packages
RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
    texlive-lang-polish  \
    texlive-generic-extra  \
    psutils  \
    latex-beamer  \
    info  \
    texlive-lang-indic  \
    texlive-lang-spanish  \
    latex-sanskrit  \
    texlive-omega  \
    texlive-lang-cyrillic  \
    texlive-lang-english  \
    prosper  \
    fragmaster  \
    texlive-base  \
    texlive-lang-european  \
    latexdiff  \
    latex-xcolor  \
    texlive-lang-african  \
    texlive-math-extra  \
    texlive-metapost  \
    texlive-lang-portuguese  \
    texlive-science  \
    tex4ht  \
    texlive-fonts-extra  \
    texlive-lang-italian  \
    dvidvi  \
    texlive-extra-utils  \
    texlive-luatex  \
    texlive-bibtex-extra  \
    latex-cjk-all  \
    texlive-latex-base  \
    texlive-font-utils  \
    texlive-fonts-recommended  \
    xindy  \
    texlive-pstricks  \
    lmodern  \
    texlive-lang-french  \
    texlive-xetex  \
    purifyeps  \
    latexmk  \
    texlive-lang-german  \
    lacheck  \
    texlive-lang-arabic  \
    texlive-plain-extra  \
    cm-super  \
    feynmf  \
    chktex  \
    tipa  \
    texlive-latex-recommended  \
    texlive-binaries  \
    texlive-music  \
    texlive-generic-recommended  \
    texlive-formats-extra  \
    texlive-humanities  \
    texlive-latex-extra  \
    texlive-publishers  \
    texlive-games  \
    pgf  \
    tex-gyre  \
    texlive-lang-greek  \
    texinfo  \
    context  \
    dvipng  \
    lcdf-typetools  \
    texlive-pictures  \
    texlive-lang-czechslovak  \
    texlive-lang-cjk  \
    t1utils  \
    texlive-lang-other

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
