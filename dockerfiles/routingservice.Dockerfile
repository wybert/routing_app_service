FROM condaforge/mambaforge
COPY environment.yml environment.yml
RUN mamba env update -n base -f environment.yml

COPY routing_app.py routing_app.py
# RUN my app panel serve --port 5006 --address 0.0.0.0 --allow-websocket-origin=199.94.60.108:5006 routing_app.ipynb
CMD ["panel", "serve", "--port", "5006", "--address", "0.0.0.0", "--num-threads", "6", "--allow-websocket-origin","*", "routing_app.py"]
# expose the port 5006
EXPOSE 5006
