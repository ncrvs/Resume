from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List

app = FastAPI(
    title="HelpDesk Tickets API",
    description="REST API для приема и управления заявками технической поддержки"
)

class Ticket(BaseModel):
    id: int
    user_name: str
    pc_name: str
    issue: str
    status: str = "Открыта"

tickets_db = [
    Ticket(id=1, user_name="Анна (Бухгалтерия)", pc_name="WS-ACC-01", issue="Не подключается VPN", status="Открыта")
]

@app.get("/tickets", response_model=List[Ticket], summary="Получить все заявки")
def get_all_tickets():
    return tickets_db

@app.post("/tickets", response_model=Ticket, summary="Создать новую заявку")
def create_ticket(user_name: str, pc_name: str, issue: str):
    new_id = max([t.id for t in tickets_db], default=0) + 1
    new_ticket = Ticket(id=new_id, user_name=user_name, pc_name=pc_name, issue=issue)
    tickets_db.append(new_ticket)
    return new_ticket

@app.put("/tickets/{ticket_id}/close", summary="Закрыть заявку по ID")
def close_ticket(ticket_id: int):
    for ticket in tickets_db:
        if ticket.id == ticket_id:
            ticket.status = "Решена"
            return {"message": f"Заявка #{ticket_id} успешно закрыта"}
    raise HTTPException(status_code=404, detail="Заявка не найдена")