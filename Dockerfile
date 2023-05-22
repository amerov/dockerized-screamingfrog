FROM ubuntu:22.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt update && apt upgrade -y
RUN apt install ttf-mscorefonts-installer sudo wget xdg-utils \
    libgconf-2-4 zenity fonts-wqy-zenhei xvfb libgtk2.0-0 libnss3 libxss1 -y
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_18.1_all.deb
RUN dpkg -i screamingfrogseospider_18.1_all.deb
RUN rm screamingfrogseospider_18.1_all.deb

RUN mkdir /root/.ScreamingFrogSEOSpider
RUN touch /root/.ScreamingFrogSEOSpider/spider.config
RUN echo 'eula.accepted=12' >> /root/.ScreamingFrogSEOSpider/spider.config

COPY licence.txt /root/.ScreamingFrogSEOSpider/licence.txt

COPY start_screamingfrog.sh /root/start_screamingfrog.sh
RUN chmod +x /root/start_screamingfrog.sh

RUN mkdir crawls

ENV DISPLAY :99

ENTRYPOINT ["/root/start_screamingfrog.sh"]
