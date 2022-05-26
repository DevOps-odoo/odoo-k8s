FROM odoo:13.0
USER root
COPY ./entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

COPY ./odoo.conf /etc/odoo
RUN chown odoo /etc/odoo/odoo.conf
RUN mkdir -p /mnt/extra-addons \
       && chown -R odoo /mnt/extra-addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons" ]

EXPOSE 8069 

ENV ODOO_RC /etc/odoo/odoo.conf
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
