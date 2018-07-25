FROM python:2.7

ENV cubes_folder /srv/cubes

RUN pip install Flask SQLAlchemy psycopg2 cubes[all]

COPY cubes-start /usr/local/bin/

WORKDIR $cubes_folder

VOLUME [$cubes_folder]

COPY data.sqlite $cubes_folder
COPY model.json $cubes_folder
COPY slicer.ini $cubes_folder


EXPOSE 5000

CMD ["sh", "/usr/local/bin/cubes-start"]