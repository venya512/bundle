FROM longhornio/support-bundle-kit:v0.0.81

COPY run.sh /custom/run.sh
RUN chmod +x /custom/run.sh

# Вставляем выполнение в стандартный скрипт
RUN echo 'echo "=== CUSTOM INFO ===" >> /tmp/custom-info.txt' >> /usr/local/bin/support-bundle.sh && \
    echo '/custom/run.sh >> /tmp/custom-info.txt 2>&1' >> /usr/local/bin/support-bundle.sh
