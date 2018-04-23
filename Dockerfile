FROM nginx:alpine

ENV APP_LANDING_PAGE_VERSION 8884e65

RUN wget -q https://github.com/viblo-asia/app-landing-page/releases/download/$APP_LANDING_PAGE_VERSION/dist.zip
RUN mkdir -p /var/www/app
RUN unzip dist.zip -d /var/www/app

COPY nginx.conf /etc/nginx

CMD nginx -g "daemon off; pid /run/nginx.pid;"

EXPOSE 80
