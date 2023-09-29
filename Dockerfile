FROM ghcr.io/project-osrm/osrm-backend
RUN apt update && apt install -y wget
RUN mkdir /data
WORKDIR /data

# build from scratch
# RUN wget https://download.geofabrik.de/north-america-latest.osm.pbf
# RUN osrm-extract -p /opt/car.lua north-america-latest.osm.pbf || echo "osrm-extract failed"
# RUN osrm-partition north-america-latest.osrm || echo "osrm-partition failed"
# RUN osrm-customize north-america-latest.osrm || echo "osrm-customize failed"
# RUN rm north-america-latest.osm.pbf

# use the processed data
COPY urls.csv /data/urls.csv
RUN wget -i urls.csv
RUN rm urls.csv

CMD ["osrm-routed", "--ip", "0.0.0.0", "--port", "5000", "--max-table-size", "1000000000", "--max-viaroute-size", "100000000",  "--max-trip-size", "1000000000", "--algorithm", "mld", "/data/north-america-latest.osrm"]
# CMD ["osrm-routed", "--algorithm", "mld", "/data/north-america-latest.osrm"]
EXPOSE 5000

