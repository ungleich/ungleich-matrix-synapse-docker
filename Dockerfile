FROM matrixdotorg/synapse:v1.38.0

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
