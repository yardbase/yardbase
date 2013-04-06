window.Yardbase ||= 
  host: "http://yardbase.herokuapp.com"
  includeScriptTag: (url) ->
    script = document.createElement 'script'
    script.setAttribute 'type', 'text/javascript'
    script.setAttribute 'src', url
    document.body.appendChild script
    
window.YardbaseCallback = ->
  console?.log 'Please define a callback at Yardbase.Query.jsonpCallback or pass one in to Yardbase.Query.execute()'
