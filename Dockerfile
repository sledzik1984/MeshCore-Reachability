FROM python:3.11-slim

WORKDIR /app

# Deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt* ./
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

# Perms
RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["./entrypoint.sh"]
