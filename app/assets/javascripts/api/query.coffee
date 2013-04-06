class Yardbase.Query
  queryParams: {}
  tag_list: []
  initialize: ->
    @id = new Date().getTime()

  with_tag: (tag) ->
    @tag_list.push(tag)
    @

  where: (key, value) ->
    @queryParams[key] = value
    @

  url: ->
    url = "http://yardbase.herokuapp.com/things?" 
    params = []
    if @tag_list.length > 0
      params.push "tags=" + encodeURIComponent(@tag_list.join(','))

    for qp of @queryParams
      key = encodeURIComponent qp
      val = encodeURIComponent @queryParams[qp]
      params.push "#{key}=#{val}"

    url += params.join("&")
    url

  execute: (callback) ->
    if callback?
      YardbaseCallback = callback
    Yardbase.includeScriptTag @url()


