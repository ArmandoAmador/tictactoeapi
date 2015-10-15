# TicTacToeApi

## webserver that allows a user to play tic tac toe by posting moves to the server as JSON.

## Todo List
 - Game
 - User authentication
 - Make it two player
 - Ability to play against the computer

### Creating a User

```
curl --request POST --header "Content-Type: application/json" -d '{
  "user": {
    "username": "johndoe",
    "password": "foobarbaz"
  }
}' http://localhost:3000/users
```

```
{"id":1,"username":"johndoe","password":"foobarbaz","created_at":"2015-10-15T18:41:59.711Z","updated_at":"2015-10-15T18:41:59.711Z"}
```

### Show a User

```
curl --request GET --header "Content-Type: application/json" -d '{}' http://localhost:3000/users/1
```

response
```
{"id":1,"username":"johndoe","password":"foobarbaz","created_at":"2015-10-15T18:41:59.711Z","updated_at":"2015-10-15T18:53:07.342Z"}
```


### Updating a User

```
curl --request PATCH --header "Content-Type: application/json" -d '{
  "user": {
    "username": "henry"
  }
}' http://localhost:3000/users/1
```

response
```
{"id":1,"username":"henry","password":"foobarbaz","created_at":"2015-10-15T18:41:59.711Z","updated_at":"2015-10-15T18:53:07.342Z"}
```

### Destroying a User

```
curl --request DELETE --header "Content-Type: application/json" -d '{}' http://localhost:3000/users/1
```

