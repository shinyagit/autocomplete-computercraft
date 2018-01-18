provider =
  # This will work on JavaScript and CoffeeScript files, but not in js comments.
  selector: '.source.lua'
  disableForSelector: '.source.lua'

  # This will take priority over the default provider, which has an inclusionPriority of 0.
  # `excludeLowerPriority` will suppress any providers with a lower priority
  # i.e. The default provider will be suppressed
  inclusionPriority: 1
  excludeLowerPriority: true

  # This will be suggested before the default provider, which has a suggestionPriority of 1.
  suggestionPriority: 2

  # Let autocomplete+ filter and sort the suggestions you provide.
  filterSuggestions: true

  # Required: Return a promise, an array of suggestions, or null.
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix, activatedManually}) ->
    new Promise (resolve) ->
      resolve([text: 'something'])

  # (optional): (*experimental*) called when user the user selects a suggestion for the purpose of loading additional information about the suggestion.
  getSuggestionDetailsOnSelect: (suggestion) ->
    new Promise (resolve) ->
      resolve(newSuggestion)

  # (optional): called _after_ the suggestion `replacementPrefix` is replaced
  # by the suggestion `text` in the buffer
  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->

  # (optional): called when your provider needs to be cleaned up. Unsubscribe
  # from things, kill any processes, etc.
  dispose: ->
