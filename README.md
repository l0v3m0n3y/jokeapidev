# jokeapidev
api for jokeapi.dev joke api site
# Example(one part joke)
```nim
import asyncdispatch, jokeapi, json

let joke = waitFor get_joke_by_type()
echo joke["joke"]
```
# Example(two part joke)
```nim
import asyncdispatch, jokeapi, json

let twopart_joke = waitFor get_joke_by_type(jokeType="twopart")
echo twopart_joke["setup"]
echo twopart_joke["delivery"]
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
