FROM python:3-alpine
ADD site /srv/site
ENTRYPOINT ["python3", "-m", "http.server", "--directory", "/srv/site", "80"]
