# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# check si DOM ready
$(document).on('turbolinks:load', ->

	# ajoute l'id de l'entité sélectionnée dans le champ caché
	set_selected_group = (id) ->
		$('#requested_group_id').val(id)

	# autocomplete pour la recherche de groups pour demander à le rejoindre
	$('#searchgroups').autocomplete
		source: (request, response) ->
			$.getJSON('/search_groups?term=' + request.term, (data) ->
				response($.map(data, (item) ->
					return(label: item.name, id: item.id))))
		select:  (event, ui) ->
			console.log(ui.item)
			set_selected_group(ui.item.id)
		appendTo: "#autocomplete_suggestions"
		# permet la sélection auto du premier élément de la liste
		autoFocus: true

	# évite l'envoi du formulaire en cliquant par erreur sur entrée dans l'input de recherche de groupe
	$('#search_groups').on('keydown', (e) ->
		if e.which == 13	# \n ASCII code
			e.preventDefault()
	)

	# affichage/disparition du modal de groupes
	$('#link_to_my_groups, .close_modal_link').click((event)->
		event.preventDefault()
		$('#modal_wrapper').fadeToggle()
	)
	$('#modal_wrapper').click((event)->
		$(this).fadeToggle()
	)
	$('#groups_modal_box').click((event)->
		event.stopPropagation()
	)

)
