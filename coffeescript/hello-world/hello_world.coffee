class HelloWorld
  constructor: () ->
  hello: (@name) ->
    name = @name || "World"
    "Hello, #{name}!"

module.exports = HelloWorld