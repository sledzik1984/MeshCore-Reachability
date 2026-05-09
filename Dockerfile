# Dockerfile
FROM python:3.11-slim

# Ustawienie katalogu roboczego
WORKDIR /app

# Instalacja zależności systemowych (np. dla komunikacji szeregowej lub kompilacji)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Kopiowanie plików zależności (jeśli istnieją)
COPY requirements.txt* ./
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Kopiowanie reszty kodu aplikacji
COPY . .

# Domyślny punkt wejścia - dostosuj nazwę pliku (np. reachability.py)
# Jeśli aplikacja to moduł, użyj: CMD ["python", "-m", "nazwa_modulu"]
ENTRYPOINT ["python"]
CMD ["reachability.py"]

