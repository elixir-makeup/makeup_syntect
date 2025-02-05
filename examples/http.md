## HTTP Example

```http_request_and_response
# HTTP Request
GET /api/users/123 HTTP/1.1
Host: api.example.com
Accept: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)
Cache-Control: no-cache
Connection: keep-alive

# HTTP Response
HTTP/1.1 200 OK
Date: Wed, 05 Feb 2025 10:30:15 GMT
Content-Type: application/json
Content-Length: 157
Cache-Control: private, max-age=3600
X-Request-ID: f28b9a6d-c2a1-4d9b-9c62-764f234f1234
Access-Control-Allow-Origin: *

{
    "id": 123,
    "name": "John Doe",
    "email": "john.doe@example.com",
    "created_at": "2025-01-15T08:00:00Z",
    "status": "active"
}
```