FROM python:3.9

WORKDIR /app

COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY app/ .

CMD ["gunicorn", "--bind", "0.0.0.0:8050", "app:app"]