@echo off
echo ==========================================
echo    Starting ATS Resume Scorer Services
echo ==========================================
echo.

echo [1/2] Starting FastAPI Backend...
start "ATS Backend (FastAPI)" cmd /k ".\venv\Scripts\python.exe -m uvicorn backend.main:app --host 0.0.0.0 --port 8000"

echo Waiting 5 seconds for backend to initialize...
timeout /t 5 /nobreak > NUL

echo [2/2] Starting Streamlit Frontend...
start "ATS Frontend (Streamlit)" cmd /k ".\venv\Scripts\streamlit.exe run frontend\streamlit_app.py --server.port 8501"

echo.
echo ==========================================
echo All services started in new windows!
echo The app will open in your browser shortly.
echo You can safely close this script window.
echo ==========================================
pause
