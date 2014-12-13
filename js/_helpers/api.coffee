app.Api = ->
  return

app.Api::list = (sammy, endpoint, dataParams) ->
  url = 'mockup/'+endpoint+'.json'
  return sammy.load(url)

app.Api::get = (sammy, enpoint, id) ->
  url = 'mockup/'+endpoint+'/'+id+'.json'
  return sammy.load(url)



