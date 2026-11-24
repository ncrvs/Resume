from fastapi import FastAPI
import psutil
import platform
from datetime import datetime

app = FastAPI(
    title="SysAdmin Monitor API",
    description="API для удаленного мониторинга состояния ПК/сервера",
    version="1.0"
)

@app.get("/health", summary="Проверка доступности сервера")
def health_check():
    return {
        "status": "online",
        "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "os": f"{platform.system()} {platform.release()}"
    }

@app.get("/metrics", summary="Получить нагрузку на CPU, RAM и диск")
def get_system_metrics():
    cpu_usage = psutil.cpu_percent(interval=0.5)
    ram = psutil.virtual_memory()
    disk = psutil.disk_usage('/')

    return {
        "cpu_percent": cpu_usage,
        "ram": {
            "total_gb": round(ram.total / (1024 ** 3), 2),
            "used_gb": round(ram.used / (1024 ** 3), 2),
            "percent": ram.percent
        },
        "disk": {
            "total_gb": round(disk.total / (1024 ** 3), 2),
            "free_gb": round(disk.free / (1024 ** 3), 2),
            "percent": disk.percent
        },
        "alert": "WARNING" if cpu_usage > 85 or ram.percent > 90 else "OK"
    }