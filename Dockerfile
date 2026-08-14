FROM python:3.11-slim

WORKDIR /app

# Install system libraries needed for PDF generation and NLP
RUN apt-get update && apt-get install -y \
    libpango-1.0-0 \
    libharfbuzz0b \
    libpangoft2-1.0-0 \
    libffi-dev \
    libjpeg-dev \
    libopenjp2-7-dev \
    && rm -rf /var/lib/apt/lists/*

# Install python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download the heavy, full-intensity spaCy model
RUN python -m spacy download en_core_web_md

# Copy backend code
COPY backend/ ./backend/

# Hugging Face runs on port 7860
EXPOSE 7860

CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "7860"]
