FROM ghcr.io/divkix/docker-python-base:latest
WORKDIR /app
COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock
RUN poetry export -f requirements.txt --without-hashes --output requirements.txt
RUN pip install --disable-pip-version-check -r requirements.txt
COPY . .
ENTRYPOINT ["python3"]
CMD ["-m", "dpwatermarkbot"]
