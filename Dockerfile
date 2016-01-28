FROM alejandrofcarrera/phusion.python
MAINTAINER Fernando Serena <fernando.serena@centeropenmiddleware.com>

ENV HOME /usr/lib/agora

# Create directories & virtual env for the Fountain
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/agora
RUN .env/bin/pip install Agora-Fountain
RUN .env/bin/pip install Agora-Planner

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ./my_init.d/ /etc/my_init.d/

ENV PLANNER_FOUNTAIN_HOST localhost

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/agora"]
EXPOSE 5002
EXPOSE 5000
