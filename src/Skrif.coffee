jQuery     = require('jquery')(window)
View       = require('space-pen').View
CodeMirror = require('code-mirror')

class Skrif extends View
	@content: ->
		@div class: 'Skrif', =>
			@textarea outlet: "textArea", =>

	initialize: (settings) ->
		_settings =
			theme: 'default'

		$.extend settings, _settings

		@textArea.val(settings.content) if settings.content

    CodeMirror.fromTextArea @textArea, mode: "markdown"

    if settings.elem
		 	$(elem).append(@)
    else
			$('body').append(@)

module.exports = Skrif
window?.Skrif  = Skrif
