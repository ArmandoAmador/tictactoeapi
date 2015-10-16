# TicTacToeApi

## webserver that allows a user to play tic tac toe by posting moves to the server as JSON.

## Todo List
 - Fix persistence problem with Game and Board
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
{"user":{"id":1,"username":"johndoe","created_at":"2015-10-16T15:17:27.657Z","updated_at":"2015-10-16T15:17:27.657Z"}}
```

### Show a User

```
curl --request GET --header "Content-Type: application/json" -d '{}' http://localhost:3000/users/1
```

example response
```
{"user":{"id":1,"username":"johndoe","created_at":"2015-10-16T15:17:27.657Z","updated_at":"2015-10-16T15:17:27.657Z"}}
```


### Updating a User

```
curl --request PATCH --header "Content-Type: application/json" -d '{
  "user": {
    "username": "henry"
  }
}' http://localhost:3000/users/1
```

example response
```
{"user":{"id":1,"username":"henry","created_at":"2015-10-16T15:17:27.657Z","updated_at":"2015-10-16T15:18:08.224Z"}
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

example response
```
{"game":{"id":20,"status":"Game in Progress","board":[["","",""],["","",""],["","",""]],"player_1_id":1,"player_2_id":null}}
```

### Show a Game

```
curl --request GET --header "Content-Type: application/json" -d '{}' http://localhost:3000/games/1
```

example response
```
{"game":{"id":1,"status":"Game in Progress","board":[["","",""],["","",""],["","",""]],"created_at":"2015-10-16T15:44:08.583Z","updated_at":"2015-10-16T15:44:08.583Z","player_1_id":1,"player_2_id":null}}
```

### Updating/Joining a game

```
curl --request PATCH --header "Content-Type: application/json" -d '{
  "game": {
    "player_2_id": "2"
  }
}' http://localhost:3000/games/1
```

example response
```
{"game":{"id":1,"status":"Game in Progress","board":[["","",""],["","",""],["","",""]],"created_at":"2015-10-16T15:44:08.583Z","updated_at":"2015-10-16T16:02:34.835Z","player_1_id":1,"player_2_id":2}}
```

### Destroy a Game

```
curl --request DELETE --header "Content-Type: application/json" -d '{}' http://localhost:3000/games/1
```


### make a move

Choose a location where you want to post your move

| 1 | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 |

```
curl --request POST --header "Content-Type: application/json" -d '{
  "location": "1", "move": "x"
}' http://localhost:3000/games/2/make_move
```

| X | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 |

example response

```
{"game":{"id":1,"status":"Game in Progress","board":[["x","",""],["","",""],["","",""]],"created_at":"2015-10-16T16:06:40.925Z","updated_at":"2015-10-16T16:15:15.049Z","player_1_id":1,"player_2_id":null}}
```

