# Robot Game API

## About 
This is a very simple API for a simple [Robot Game](https://github.com/jdcarey128/robot-game). The deployed game is hosted on Netlify and can be played [here](https://robot-grid-game.netlify.app/). 

## Requirements 
Rails 5  
MongoDB ([Installation](https://docs.mongodb.com/manual/installation/))

## Installation
```zsh
bundle install
```

## Run local server  
http://localhost:300/
```
rails s
```

## Testing 
```
bundle exec rspec
```

## Endpoints 
`GET /users`  
Returns top 10 users and their scores for the game. 
```zsh
[
  {
    "_id": {
      "$oid": String
    },
    "name": String,
    "score": Integer
  },
  ...
]
```

`POST /users`  
Creates a user document and returns document. Requires name and score input.
```zsh 
# Request body 
{
  "name": String, 
  "score": Integer
}

# response 
{
  "_id": {
    "$oid": String
  },
  "name": String,
  "score": Integer
}
```
`GET /users/<$oid>`  
Returns the document given its associated $oid. Returns `null` for a document that doesn't exist. 
```zsh 
{
  "_id": {
    "$oid": String
  },
  "name": String,
  "score": Integer
}
```

`DELETE /users/<$oid>`  
Deletes the document associated with the $oid with a 204 response status. 

### Author
**Joshua Carey** - *Turing Graduate* - [GitHub Profile](https://github.com/jdcarey128) - [Turing Alum Portfolio](https://terminal.turing.edu/alumni/595-joshua-carey) - [LinkedIn](https://www.linkedin.com/in/carey-joshua/)
