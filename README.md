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
            "user_id": 1,
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
            "user_id": 1,
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
    "user_id": 1,
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
id: ID of board to add list to
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



