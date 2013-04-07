window.Yardbase ||= 
  #host: "http://yardbase.herokuapp.com"
  host: "http://localhost:3000"
  includeScriptTag: (url) ->
    script = document.createElement 'script'
    script.setAttribute 'type', 'text/javascript'
    script.setAttribute 'src', url
    document.body.appendChild script
