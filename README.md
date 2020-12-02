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
    "id": 1,
    "email": "email@mail.com",
    "created_at": "2020-12-02T17:51:54.656Z",
    "updated_at": "2020-12-02T17:51:54.656Z",
    "password_digest": "$2a$12$xt7MdzZ5tefJwter8/VRyeAWcdFkCJW4LbAW7AHARX7Db7b9KiFCy"
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



