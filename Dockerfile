FROM nginx:stable-alpine

LABEL license="EPL 1.0" \
      name="testeditor/web"

ENV WORK_DIR=/usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.default.conf /etc/nginx/conf.d/default.conf
COPY dist ${WORK_DIR}/
COPY run.sh ${WORK_DIR}/

RUN chmod -R 777 /var/log/nginx /var/cache /var/run && \
    chmod -R 777 /etc/nginx/* && \
    chmod -R 777 /usr/share/nginx/*

EXPOSE 4200

USER nginx

WORKDIR ${WORK_DIR}

ENTRYPOINT [ "/bin/sh", "run.sh" ]
