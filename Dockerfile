FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

RUN sed -i '$a echo "=== CUSTOM INFO ===" >> /var/log/custom-info.txt' /usr/local/bin/support-bundle.sh && \
    sed -i '$a /custom/run.sh >> /var/log/custom-info.txt 2>&1' /usr/local/bin/support-bundle.sh
