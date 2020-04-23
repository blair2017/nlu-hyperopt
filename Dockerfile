FROM rasa/rasa:1.9.6-full

WORKDIR "/"

COPY setup.py .
COPY requirements.txt .
COPY data /data
COPY nlu_hyperopt /nlu_hyperopt
COPY scripts /scripts

# Be root
USER root

RUN pip install -U pip && pip install -r requirements.txt && chmod -R +x /scripts 

ENV PYTHONPATH "/"
ENV DATA_DIRECTORY "/data"
ENV MODEL_DIRECTORY "/models"

ENTRYPOINT ["python"]

CMD ["-m", "nlu_hyperopt.app"]
