app.sammy = Sammy('#main', ->
  # include the plugin and alias handlebars() to hb()
  this.use('Handlebars', 'hb')
  # routes with templates
  this.get('#/', (context) ->
    app.template.render(this, 'index')
    return
  )
  this.get('#/posts', (context) ->
    this.load('mockup/posts.json')
      .then (posts) ->
        console.log posts
        return


    app.api.list(this, 'posts').then (posts) ->
      app.template.render(this, 'posts', posts)
      return
    return
  )
  this.get('#/post/:id', (context) ->
    this.load('mockup/posts/' + id + '.json').then (post) ->
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
