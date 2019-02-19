FROM nginx:alpine

WORKDIR /var/www

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

ENV APP_LANDING_PAGE_VERSION 8884e65
RUN wget -q https://github.com/viblo-asia/app-landing-page/releases/download/$APP_LANDING_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/app \
    && unzip dist.zip -d /var/www/app \
    && rm dist.zip

ENV TOOLS_LANDING_PAGE_VERSION v1.0.0
RUN wget -q https://github.com/viblo-asia/tools-landing-page/releases/download/$TOOLS_LANDING_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/tools \
    && unzip dist.zip -d /var/www/tools \
    && rm dist.zip

ENV CAREERS_PAGE_VERSION master
RUN wget -q https://github.com/viblo-asia/careers/releases/download/$CAREERS_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/careers \
    && unzip dist.zip -d /var/www/careers \
    && rm dist.zip

ENV ORGANIZATION_PAGE_VERSION v1.0.5
RUN wget -q https://github.com/viblo-asia/organization-landing-page/releases/download/$ORGANIZATION_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/organization-feature \
    && unzip dist.zip -d /var/www/organization-feature \
    && rm dist.zip

COPY nginx.conf /etc/nginx
COPY error.html /var/www
COPY maintain.html /var/www
ADD assets /var/www/assets

CMD nginx -g "daemon off; pid /run/nginx.pid;"

EXPOSE 80
