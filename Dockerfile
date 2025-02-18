# Stage 1: Build
FROM python:3.9-slim AS build

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Run
FROM python:3.9-slim

WORKDIR /app

COPY --from=build /app /app

CMD ["python", "app.py"]