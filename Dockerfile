FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

# свой entrypoint
ENTRYPOINT ["/bin/sh", "-c", "/custom/run.sh > /var/log/custom-info.txt 2>&1 && exec /usr/bin/entry"]
