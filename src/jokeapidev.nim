import asyncdispatch, httpclient, json, strutils

const api = "https://v2.jokeapi.dev"
var headers = newHttpHeaders({
  "Connection": "keep-alive", 
  "Host": "v2.jokeapi.dev", 
  "Content-Type": "application/json", 
  "accept": "application/json", 
  "user-agent": "okhttp/4.12.0"
})

proc get_joke_by_type*(lang: string = "en", category: string = "dark", jokeType: string = "single", amount: int = 1, blacklist: string = ""): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    var url = api & "/joke/" & category
    var params: seq[string] = @[]
    
    if lang != "en": params.add("lang=" & lang)
    if blacklist != "": params.add("blacklistFlags=" & blacklist)
    if jokeType != "": params.add("type=" & jokeType)
    if amount > 1: params.add("amount=" & $amount)
    
    if params.len > 0:
      url &= "?" & params.join("&")
    
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_any_joke*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/joke/Any")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_categories*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/categories")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_languages*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/languages")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_ping*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/ping")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_flags*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/flags")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_info*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/info")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_endpoints*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/endpoints")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
