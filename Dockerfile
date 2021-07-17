FROM matrixdotorg/synapse:v1.38.0

RUN apk update
RUN apk add certbot

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
