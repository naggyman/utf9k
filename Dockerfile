FROM python:3.7-alpine

RUN mkdir /code

COPY . /code
WORKDIR /code

RUN pip install pipenv
RUN pipenv install --system --deploy

CMD ["python", "app.py"]