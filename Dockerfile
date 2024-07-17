FROM python:3.9
LABEL maintainer="<tech@weareoncare.com>"
ENV PYTHONUNBUFFERED 1
ENV PORT 8000
ENV DB_URL sqlite://./db.sqlite3
# COPY --chown=python:python bin/ ./bin

COPY ./ /app
WORKDIR /app

# Install dependencies
RUN pip install -r requirements.txt

WORKDIR /app/app

EXPOSE 8000
ENTRYPOINT ["/app/app/bin/entrypoint.sh"]
CMD ["gunicorn", "mysite.wsgi"]