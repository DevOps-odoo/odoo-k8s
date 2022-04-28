FROM odoo:14
USER odoo
RUN pip3 install dropbox
# Installation des dépendances personnalisées

RUN apt-get update
RUN pip3 install --upgrade 
# Définition du dossier de travail
FROM odoo:14.0
LABEL MAINTAINER assc <x@gmail.com>
USER root

