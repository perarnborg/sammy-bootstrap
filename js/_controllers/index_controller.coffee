app.IndexController = (context) ->
  @context = context
  return

app.IndexController::render = () ->
  controller = @
  controller.context.partial('templates/index.hb');
  controller.context.swap()
  return
