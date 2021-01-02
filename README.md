# API docs

### **POST /auth/sign_in**
Headers: Content-Type: application/json

Body: 
```json
{
    "auth": {
        "email": "email@mail.com",
        "password": "1234"
    } 
}
```

Response:
```json
{
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDU4MDAyODQsInN1YiI6MSwiZW1haWwiOiJiYXJ0ZWtAbWFpbC5jb20ifQ.GUjZeJnsD9k-84SQCeI7xzsA82vHLM-Ivzqs_r7V9Pw"
}
```

### **POST /auth/sign_up**
Headers: Content-Type: application/json

Body: 
```json
{
	"user": {
		"email": "email@mail.com",
        "password": "1234"
	}
}
```

Response:
```json
{
    "status": "CREATED",
    "message": "User created"
}
```

### **GET /api/boards**

Headers: Content-Type: application/json

Authorization: Bearer token

Response:
```json
{
    "status": "OK",
    "message": "Returning boards",
    "data": [
        {
            "id": 1,
            "name": "Board Name",
            "created_at": "2020-11-18T13:05:17.839Z",
            "updated_at": "2020-11-18T13:05:17.839Z"
        }
    ]
}
```
### **POST /api/board/add**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "name": "Board Name"
}
```

Response:
```json
{
    "status": "CREATED",
    "message": "Returning current boards",
    "data": [
        {
            "id": 1,
            "name": "Board Name",
            "created_at": "2020-11-18T13:05:17.839Z",
            "updated_at": "2020-11-18T13:05:17.839Z"
        }
    ]
}
```

### **POST /api/board/edit**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "name": "Testowa zmiana"
}
```

Response:
```json
{
    "status": "UPDATED",
    "message": "Board updated"
}
```
lub
```json
{
    "status": "UNAUTHORIZED",
    "message": "This board does not belong to you"
}
```

### **GET /api/board**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1
}
```

Response:
```json
{
    "id": 1,
    "name": "project B 1",
    "created_at": "2020-12-02T19:17:30.535Z",
    "updated_at": "2020-12-02T19:17:30.535Z",
    "lists": [
        {
            "id": 1,
            "name": "lista 1",
            "board_id": 1,
            "created_at": "2020-12-02T19:18:09.358Z",
            "updated_at": "2020-12-02T19:18:09.358Z",
            "cards": [
                {
                    "id": 1,
                    "name": "karta testowa",
                    "description": "karta swtorzona w celach testowych",
                    "list_id": 1,
                    "created_at": "2020-12-02T19:49:02.772Z",
                    "updated_at": "2020-12-02T19:49:02.772Z"
                }
            ]
        }
    ]
}
```
lub
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```

### **POST /api/list/add**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "name": "lista 3"
}
```
id: ID of board to add list to

Response:
```json
{
    "status": "OK",
    "message": "List created"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```

### **POST /api/card/add**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "name": "karta testowa",
    "description": "karta swtorzona w celach testowych"
}
```
id: ID of board to get list from
list_id: ID of list to add card to

Response:
```json
{
    "status": "CREATED",
    "message": "Card created"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```

### **POST /api/card/remove**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "card_id": 1
}
```
id: ID of board to get list from
list_id: ID of list to remove card from
card_id: ID of card to delete

Response:
```json
{
    "status": "OK",
    "message": "Card deleted"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
### **POST /api/list/remove**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1
}
```
id: ID of board to remove list from
list_id: ID of list to remove

Response:
```json
{
    "status": "OK",
    "message": "List deleted"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```

### **POST /api/list/edit/name**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "name": "new list name"
}
```
id: ID of board to edit list from
list_id: ID of list to edit

Response:
```json
{
    "status": "OK",
    "message": "List updated"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```

### **POST /api/card/edit**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "card_id": 1,
    "name": "new name",
    "description": "new description"
}
```
name and description fields are optional (if not submitted the attribute will remain the same)

id: ID of board to get list from
list_id: ID of list to remove card from
card_id: ID of card to delete

Response:
```json
{
    "status": "OK",
    "message": "Card edited"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or card does not exist"
}
```

### **POST /api/card/edit/deadline**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "card_id": 1,
    "deadline": 1609608100
}
```
id: ID of board to get list from
list_id: ID of list to remove card from
card_id: ID of card to delete

deadline: unix timestamp

Response:
```json
{
    "status": "OK",
    "message": "Card deadline updated"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or card does not exist"
}
```

### **POST /api/board/add_user**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "email": "person@mail.com",
    "board_id": 1
}
```
email: mail of user you want to add to your table
board_id: id of board you want to add user to

Response:
```json
{
    "status": "OK",
    "message": "User assigned"
}
```
lub 
```json
{
    "status": "UNAUTHORIZED",
    "message": "This board does not belong to you or does not exist"
}
```

### **POST /api/list/change_archive_status**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1
}
```
id: ID of board to get list from
list_id: ID of list to archive 

Changes archived status to opposite one (all cards included)

Response:
```json
{
    "status": "OK",
    "message": "List status updated"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```

### **POST /api/card/change_archive_status**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "card_id": 1
}
```
id: ID of board to get list from
list_id: ID of list to archive card from 
card_id: ID of card to archive

Changes archived status to opposite one

Response:
```json
{
    "status": "OK",
    "message": "Card status updated"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
lub
```json
{
    "status": "ERROR",
    "message": "You do not have rights or card does not exist"
}
```

### **POST /api/list/change_order**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "position": 2
}
```
id: ID of board to get list from
list_id: ID of list to archive 
position: new list position


Response:
```json
{
    "status": "OK",
    "message": "List position updated"
}
```
lub
```json
{
    "status": "OK",
    "message": "List position unchanged"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
### **GET /api/card/events**
Headers: Content-Type: application/json

Authorization: Bearer token

Body: 
```json
{
    "id": 1,
    "list_id": 1,
    "card_id": 1
}
```
id: ID of board to get list from
list_id: ID of list to get card from
card_id: ID of card to get events from

Response:
```json
{
    "status": "OK",
    "message": "Returning events",
    "data": [
        {
            "id": 1,
            "name": "created",
            "timestamp": 1609624414,
            "card_id": 1,
            "created_at": "2021-01-02T21:53:34.321Z",
            "updated_at": "2021-01-02T21:53:34.321Z"
        },
        {
            "id": 2,
            "name": "archived",
            "timestamp": 1609624490,
            "card_id": 1,
            "created_at": "2021-01-02T21:54:50.211Z",
            "updated_at": "2021-01-02T21:54:50.211Z"
        }
    ]
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or board does not exist"
}
```
lub 
```json
{
    "status": "ERROR",
    "message": "You do not have rights or list does not exist"
}
```
lub
```json
{
    "status": "ERROR",
    "message": "You do not have rights or card does not exist"
}
```

