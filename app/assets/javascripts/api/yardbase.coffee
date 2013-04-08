window.Yardbase ||=
  host: "http://madison.yardbase.org"
  includeScriptTag: (url) ->
    script = document.createElement 'script'
    script.setAttribute 'type', 'text/javascript'
    script.setAttribute 'src', url
    document.body.appendChild script

window.YardbaseCallback = (result) ->
    console?.log 'Please include a callback in to Yardbase.Query.execute()'
    console?.log result
