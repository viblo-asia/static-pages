FROM nginx:alpine

WORKDIR /var/www

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

ARG APP_LANDING_PAGE_VERSION=1.0.0
RUN wget -q https://github.com/viblo-asia/app-landing-page/releases/download/$APP_LANDING_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/app \
    && unzip dist.zip -d /var/www/app \
    && rm dist.zip

ARG TOOLS_LANDING_PAGE_VERSION=v1.0.1
RUN wget -q https://github.com/viblo-asia/tools-landing-page/releases/download/$TOOLS_LANDING_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/tools \
    && unzip dist.zip -d /var/www/tools \
    && rm dist.zip

ARG CAREERS_PAGE_VERSION=1.0.0
RUN wget -q https://github.com/viblo-asia/careers/releases/download/$CAREERS_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/careers \
    && unzip dist.zip -d /var/www/careers \
    && rm dist.zip

ARG ORGANIZATION_PAGE_VERSION=v1.0.8
RUN wget -q https://github.com/viblo-asia/organization-landing-page/releases/download/$ORGANIZATION_PAGE_VERSION/dist.zip \
    && mkdir -p /var/www/organization-feature \
    && unzip dist.zip -d /var/www/organization-feature \
    && rm dist.zip

ARG SURVEY_RESULTS_VERSION=v1.0.0-beta.8
RUN wget -q https://github.com/viblo-asia/survey-results/releases/download/$SURVEY_RESULTS_VERSION/survey-results-$SURVEY_RESULTS_VERSION.zip \
    && mkdir -p /var/www/survey-results \
    && unzip survey-results-$SURVEY_RESULTS_VERSION.zip -d /var/www/survey-results \
    && rm survey-results-$SURVEY_RESULTS_VERSION.zip

ARG VIBLO_PLATFORM_VERSION=v1.0.2
RUN wget -q https://github.com/viblo-asia/about.viblo.asia/releases/download/$VIBLO_PLATFORM_VERSION/about.viblo.asia-$VIBLO_PLATFORM_VERSION.zip \
    && mkdir -p /var/www/about.viblo.asia \
    && unzip about.viblo.asia-$VIBLO_PLATFORM_VERSION.zip -d /var/www/about.viblo.asia \
    && rm about.viblo.asia-$VIBLO_PLATFORM_VERSION.zip

COPY nginx.conf /etc/nginx
COPY error.html /var/www
COPY maintain.html /var/www
ADD assets /var/www/assets

CMD nginx -g "daemon off; pid /run/nginx.pid;"

EXPOSE 80
