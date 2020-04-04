FROM ubuntu:18.04

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt update && apt install wget ttf-mscorefonts-installer xdg-utils zenity fonts-wqy-zenhei libgconf-2-4 libgtk2.0-0 libnss3 libxss1 libasound2 xvfb -y
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_12.6_all.deb
RUN dpkg -i screamingfrogseospider_12.6_all.deb
RUN rm screamingfrogseospider_12.6_all.deb
RUN mkdir /root/.ScreamingFrogSEOSpider
RUN touch /root/.ScreamingFrogSEOSpider/spider.config

RUN echo 'eula.accepted=9' >> /root/.ScreamingFrogSEOSpider/spider.config

ENV DISPLAY :99

COPY licence.txt /root/.ScreamingFrogSEOSpider/licence.txt

COPY start_screamingfrog.sh /root/start_screamingfrog.sh
RUN chmod a+x /root/start_screamingfrog.sh

ENTRYPOINT ["/root/start_screamingfrog.sh"]
