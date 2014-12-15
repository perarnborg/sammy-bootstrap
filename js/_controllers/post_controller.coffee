app.PostController = (context) ->
  @context = context
  return

app.PostController::render = () ->
  controller = @
  id = controller.context.params['id']
  app.api.get(controller.context, 'posts', id).then((post) ->
    controller.context.post = post
    controller.context.partial('templates/post.hb');
    return
  ).swap()
  return
