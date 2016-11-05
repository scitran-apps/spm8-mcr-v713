# This dockerfile borrows heavily from Nipype's base image used for testing.
FROM ubuntu-debootstrap:trusty
MAINTAINER Carlos Correa <cgc@stanford.edu>

WORKDIR /opt

# bc is used by the MCRInstaller
# unzip is used to unzip spm8
RUN apt-get update && \
  apt-get install -y \
    bc unzip \
    xorg openbox libxp6

ADD http://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/MCR/glnxa64/MCRInstaller.bin /opt/

# Install Matlab: adapted from the good old install_spm_mcr.sh of @chrisfilo
RUN echo '-P installLocation="/opt/mcr"' > mcr_options.txt && \
    chmod +x MCRInstaller.bin && \
    ./MCRInstaller.bin -silent -options mcr_options.txt && \
    rm MCRInstaller.bin mcr_options.txt

ADD http://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/spm8/spm8_r5236.zip /opt/

# Install SPM
RUN unzip spm8_r5236.zip && \
    rm spm8_r5236.zip

ENV SPMMCRCMD "/opt/spm8/run_spm8.sh /opt/mcr/v713/ script"
ENV FORCE_SPMMCR 1

CMD ["/bin/bash"]
