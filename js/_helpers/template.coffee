app.Template = ->
  return

app.Template::render = (sammy, template, data) ->
  sammy.data = data
  sammy.partial('templates/'+template+'.hb')
  return




