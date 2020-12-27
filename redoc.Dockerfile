FROM redocly/redoc
ENV PAGE_TITLE service
ENV PAGE_FAVICON https://www.acme.io/assets/img/favicons/favicon.ico
COPY src/api-doc/bff-api.yaml /usr/share/nginx/html/bff-api.yaml
ENV SPEC_URL bff-api.yaml
