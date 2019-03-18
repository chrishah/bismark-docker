FROM ubuntu:18.04

MAINTAINER Christoph Hahn <christoph.hahn@tugraz.at>

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y build-essential git wget zip libtbb-dev zlib1g-dev libncurses5-dev libbz2-dev liblzma-dev libcurl3-dev && \
	apt-get clean && apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src

#bowtie 2
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.5/bowtie2-2.3.5-linux-x86_64.zip && \
	unzip bowtie2-2.3.5-linux-x86_64.zip && \
	rm bowtie2-2.3.5-linux-x86_64.zip

#Samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
	tar jxf samtools-1.9.tar.bz2 && \
	rm samtools-1.9.tar.bz2 && \
	cd samtools-1.9 && \
	./configure --prefix $(pwd) && \
	make 

#bismark
RUN wget https://github.com/FelixKrueger/Bismark/archive/0.21.0.tar.gz && \
	tar xvfz 0.21.0.tar.gz && \
	rm 0.21.0.tar.gz

ENV PATH="${PATH}:/usr/src/bowtie2-2.3.5-linux-x86_64:/usr/src/Bismark-0.21.0:/usr/src/samtools-1.9"