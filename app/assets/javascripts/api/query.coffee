class Yardbase.Query
  queryParams: {}
  tag_list: []
  @callbacks: {}
  defaultCallback: (result) -> 
    console?.log 'Please include a callback in to Yardbase.Query.execute()'
    console?.log result

  constructor: ->
    @callbackKey = new Date().getTime()
    @

  with_tag: (tag) ->
    @tag_list.push(tag)
    @

  where: (key, value) ->
    @queryParams[key] = value
    @

  url: ->
    url = "#{Yardbase.host}/things.json?" 
    params = ["jsonpCallback=Yardbase.Query.callbacks[#{@callbackKey}]"]
    if @tag_list.length > 0
      params.push "tags=" + encodeURIComponent(@tag_list.join(','))

    for qp of @queryParams
      key = encodeURIComponent qp
      val = encodeURIComponent @queryParams[qp]
      params.push "#{key}=#{val}"

    url += params.join("&")
    url

  execute: (callback) ->
    Yardbase.Query.callbacks[@callbackKey] = callback || @defaultCallback
    Yardbase.includeScriptTag @url()


