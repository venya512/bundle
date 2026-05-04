FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

ENTRYPOINT ["/bin/sh", "-c", "/custom/run.sh; exec /usr/bin/entrypoint.sh"]
