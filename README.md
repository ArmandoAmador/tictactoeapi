# TicTacToeApi

## webserver that allows a user to play tic tac toe by posting moves to the server as JSON.

## Todo List
 - User authentication
 - Make it two player
 - Ability to play against the computer

## User Curl Commands

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

### Creating a Game

```
curl --request POST --header "Content-Type: application/json" -d '{
  "game": {
    "player_1_id": "1"
  }
}' http://localhost:3000/games
```

response
```
{"id":12,"status":"Game in Progress","board":{"grid":[["","",""],["","",""],["","",""]]},"player_1_id":1,"player_2_id":null,"created_at":"2015-10-15T22:56:03.412Z","updated_at":"2015-10-15T22:56:03.412Z"}
```

### Show a Game

```
curl --request GET --header "Content-Type: application/json" -d '{}' http://localhost:3000/games/1
```

response
```
{"id":1,"status":"Game in Progress","board":{"grid":[["","",""],["","",""],["","",""]]},"player_1_id":1,"player_2_id":2,"created_at":"2015-10-15T21:14:14.556Z","updated_at":"2015-10-15T21:14:14.556Z"}
```

### Updating a game

```
curl --request PATCH --header "Content-Type: application/json" -d '{
  "game": {
    "player_2_id": "12"
  }
}' http://localhost:3000/games/1
```

response
```
{"id":1,"status":"Game in Progress","board":{"grid":[["","",""],["","",""],["","",""]]},"player_1_id":1,"player_2_id":12,"created_at":"2015-10-15T21:14:14.556Z","updated_at":"2015-10-15T23:27:48.538Z"}
```

### Destroy a Game

```
curl --request DELETE --header "Content-Type: application/json" -d '{}' http://localhost:3000/games/1
```
