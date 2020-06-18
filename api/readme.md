# PayDay Bank Mock API
A Mock API with all the services that PayDay Bank currently has available.

The Mock API runs on a [Node JS](https://nodejs.org/en/) server and makes use of [JSON-Server](https://github.com/typicode/json-server) and [LowDb](https://github.com/typicode/lowdb) for mocking data defined in the `db.json` file. 

## Install the API
`$npm install`

## Run the API
`$ node server.js`

## Default Routes:
*PS: GET, POST, PUT, PATCH, DELETE operations are supported on most routes, however support for this is not fully implemented yet, soo make use of the notes below to get a better perspective of what is currently supported. The routes also support optional params for filtering as well as additional filtering options as defined by [JSON-Server](https://github.com/typicode/json-server).*

### Authentication (POST)
```
POST: http://localhost:3000/authenticate
Body:
{
  "email":"Nadiah.Spoel@example.com",
  "password":"springs"
}

Response:
{
  "id": 1,
  "First Name": "Nadiah",
  "Last Name": "Spoel",
  "gender": "female",
  "email": "Nadiah.Spoel@example.com",
  "password": "springs",
  "dob": "1983-05-22T06:22:24.377Z",
  "phone": "5049540375"
}
```
### Customers (GET, POST, PUT, PATCH, DELETE)
```
POST: http://localhost:3000/customers
Body: 
{
  "First Name": "Tom",
  "Last Name": "Newton",
  "gender": "female",
  "email": "Tom.Newton@example.com",
  "password": "springs",
  "dob": "1993-02-12T08:22:24.377Z",
  "phone": "1049520521"
}

Response:
{
  "First Name": "Nadiah",
  "Last Name": "Spoel",
  "gender": "female",
  "email": "Tom.Newton@example.com",
  "password": "springs",
  "dob": "1993-02-12T08:22:24.377Z",
  "phone": "1049520521",
  "id": 5
}
```

### Accounts (GET, PUT, PATCH, DELETE) - *POST not fully supported yet*
```
GET:http://localhost:3000/accounts
Response:
{
"id": 2,
"customer_id": 1,
"iban": "CR63 9723 6739 2728 6349 7",
"type": "Savings",
"date_created": "1/14/2019",
"active": true
}
```

### Transactions (GET, POST, PUT, PATCH, DELETE)
```
GET:http://localhost:3000/transactions
Response:
{
"id": 2,
"account_id": 1,
"amount": "7196.35",
"vendor": "Grimes, Quigley and Runolfsson",
"category": "Salary",
"date": "2019-03-17T00:04:00Z"
}
```
