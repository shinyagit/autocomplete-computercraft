fs = require 'fs'
path = require 'path'

module.exports =
  selector: '.source.lua, .source.text'
  suggestionPriority: 2
  filterSuggestions: false
  completions: {}

  loadCompletions: ->
    fs.readFile(
      path.resolve(__dirname, '..', 'completions.json'),
      (err, data) => @completions = JSON.parse(data) unless err?)

  getSuggestions: ({prefix}) ->
    return [] if prefix.length < 10

    completions = []
    for type, names of @completions
      for name in names
        completions.push({type: type, text: name})
    completions
