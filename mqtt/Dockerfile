# FROM arm32v6/eclipse-mosquitto
FROM eclipse-mosquitto:latest
COPY mosquitto.conf /mosquitto/config/mosquitto.conf
CMD [ "mosquitto", "-c", "/mosquitto/config/mosquitto.conf" ]