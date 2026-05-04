FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

ENTRYPOINT ["/bin/sh", "-c", "/custom/run.sh > /tmp/custom-info.txt 2>&1; exec /usr/bin/entrypoint.sh"]
