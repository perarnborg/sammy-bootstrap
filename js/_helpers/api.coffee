app.Api = ->
  @useMockups = true
  return

app.Api::list = (sammy, endpoint, params) ->
  url = @getUrl(endpoint, params)
  return sammy.load(url)

app.Api::get = (sammy, endpoint, id, params) ->
  url = @getUrl(endpoint+'/'+id, params)
  return sammy.load(url)

app.Api::getUrl = (url, params) ->
  if @useMockups
    'mockup/'+url+'.json'
  else
    url = '/api/'+url
    for attr in params
      url += if url.indexOf('?') > -1 then '&' else '?'
      url += attr+'='+params[attr]
    url
