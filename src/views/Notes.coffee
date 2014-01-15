class Notes extends Ryggrad.View
	@content: ->
		@div =>
			@ul outlet: 'list', =>

	initialize: (notes) ->

		for note in notes
			@addNote(note)

	addNote: (note) ->
		noteView = new NoteView(note) 
		@list.append(noteView)
