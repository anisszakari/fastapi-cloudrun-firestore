FROM python:3.9
WORKDIR /app
COPY . /app
RUN pip install -r fastapi_app/requirements.txt
CMD ["uvicorn", "fastapi_app.main:app", "--host", "0.0.0.0", "--port", "8080"]
