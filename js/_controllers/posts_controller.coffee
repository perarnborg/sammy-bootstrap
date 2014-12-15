app.PostsController = (context) ->
  this.context = context
  return

app.PostsController::render = () ->
  controller = this
  app.api.list(controller.context, 'posts').then((posts) ->
    controller.context.posts = posts
    controller.context.partial('templates/posts.hb');
    return
  ).swap()
  return
