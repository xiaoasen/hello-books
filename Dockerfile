FROM python:3.11

RUN pip install --upgrade pip
RUN pip install mkdocs-material==9.1.15
RUN pip install neoteroi-mkdocs
RUN pip install mkdocs-macros-plugin
RUN pip install mkdocs-gallery
RUN pip install pillow
RUN pip install numpy
RUN pip install setuptools
RUN pip install wheel
RUN pip install pandas
RUN pip install scikit-learn
RUN pip install matplotlib
RUN pip install statsmodels
RUN pip install plotly
RUN pip install seaborn
RUN pip install sphinx-gallery

WORKDIR /app

COPY docs /app/docs
COPY mkdocs.yml /app/mkdocs.yml

RUN mkdir -p ./docs/overrides && mkdocs build

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]