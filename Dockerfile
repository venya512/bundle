FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

# запускаем твой скрипт при старте контейнера
ENTRYPOINT ["/bin/sh", "-c", "/custom/run.sh && /usr/local/bin/support-bundle"]
