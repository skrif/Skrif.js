jQuery     = require('jquery')(window)
View       = require('space-pen').View
CodeMirror = require('code-mirror/mode/markdown')

class Skrif extends View
  @content: ->
    @div class: 'Skrif', =>
      @textarea outlet: "textArea", =>

  initialize: (settings) ->
    _settings =
      theme: 'default'

    $.extend settings, _settings

    if settings.content
      @textArea.val(settings.content) 

    @editor = CodeMirror.fromTextArea @textArea[0],
      mode: "markdown"
      autofocus: true

    if settings.elem
      $(settings.elem).append(@)
    else
      $('body').append(@)

    @.addClass("theme-#{settings.theme}")

    @textArea[0].focus()
    @editor.refresh()

module.exports = Skrif
window?.Skrif  = Skrif
