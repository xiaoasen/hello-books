FROM python:3.9.0-alpine

RUN pip install --upgrade pip
RUN pip install mkdocs-material==9.1.15
RUN pip install neoteroi-mkdocs
RUN pip install mkdocs-macros-plugin

WORKDIR /app

COPY docs /app/build
COPY mkdocs.yml /app/mkdocs.yml

RUN mkdir -p ./build/overrides && mkdocs build

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]