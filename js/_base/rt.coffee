app.sammy = Sammy('#main', ->
  # include the plugin and alias handlebars() to hb()
  this.use('Handlebars', 'hb')
  # routes with templates
  this.get('#/', (context) ->
    app.template.render(this, 'index')
    return
  )
  this.get('#/posts', (context) ->
    app.api.list(this, 'posts').then (posts) ->
      app.template.render(this, 'posts', posts)
      return
    return
  )
  this.get('#/post/:id', (context) ->
    app.api.get(this, 'posts', this.params['id']).then (post) ->
      app.template.render(this, 'posts', post)
      return
    return
  )
  return
)
$(->
  app.sammy.run()
  return
)
