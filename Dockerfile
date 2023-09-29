FROM ghcr.io/project-osrm/osrm-backend
RUN apt update && apt install -y wget
# RUN mkdir -p /root/.config/rclone
# COPY rclone.conf /root/.config/rclone
RUN mkdir /data
WORKDIR /data
RUN wget https://download.geofabrik.de/north-america-latest.osm.pbf
RUN osrm-extract -p /opt/car.lua north-america-latest.osm.pbf || echo "osrm-extract failed"
RUN osrm-partition north-america-latest.osrm || echo "osrm-partition failed"
RUN osrm-customize north-america-latest.osrm || echo "osrm-customize failed"
# RUN rclone sync nerc:routing-osm-data/osrm_backend ./osrm_backend
RUN rm north-america-latest.osm.pbf
CMD ["osrm-routed", "--ip", "0.0.0.0", "--port", "5000", "--max-table-size", "1000000000", "--max-viaroute-size", "100000000",  "--max-trip-size", "1000000000", "--algorithm", "mld", "/data/north-america-latest.osrm"]
# CMD ["osrm-routed", "--algorithm", "mld", "/data/north-america-latest.osrm"]
EXPOSE 5000

