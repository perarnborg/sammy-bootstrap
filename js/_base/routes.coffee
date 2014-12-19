app.sammy = Sammy('#main', ->
  # include the plugin and alias handlebars() to hb()
  @use('Handlebars', 'hb')
  # if we want app wide api data, like a cart or user
#  @around (callback) ->
#    context = @
#    app.api.get('user', userId).then((user) ->
#      context.user = user
#    ).then(callback)
  # routes with templates
  @get('/', (context) ->
    app.controller = new app.IndexController(context)
    app.controller.render()
  )
  @get('#/posts', (context) ->
    app.controller = new app.PostsController(context)
    app.controller.render()
  )
  @get('#/post/:id', (context) ->
    app.controller = new app.PostController(context)
    app.controller.render()
  )
  return
)
$(->
  app.sammy.run()
  return
)

