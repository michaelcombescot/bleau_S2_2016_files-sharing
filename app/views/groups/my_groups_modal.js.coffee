$("#my_groups").html("<%= j render 'my_groups_modal' %>").fadeIn()

my_groups = $("#my_groups")
search_groups = $("#search_groups")

# ajoute l'id de l'entité sélectionnée dans le champ caché
set_selected_group = (id) ->
  $('#requested_group_id').val(id)

# autocomplete pour la recherche de groups pour demander à le rejoindre
search_groups.autocomplete
  source: (request, response) ->
    $.getJSON('/groups/search_groups?term=' + request.term, (data) ->
      response($.map(data, (item) ->
        return(label: item.name, id: item.id))))
  select:  (event, ui) ->
    console.log(ui.item)
    set_selected_group(ui.item.id)
  appendTo: "#autocomplete_suggestions"
  # permet la sélection auto du premier élément de la liste
  autoFocus: true

# évite l'envoi du formulaire en cliquant par erreur sur entrée dans l'input de recherche de groupe
search_groups.on('keydown', (e) ->
  if e.which == 13  # \n ASCII code
    e.preventDefault()
)

# disparition du modal de group
my_groups.on('click', '.close_modal_link', (event)->
  event.preventDefault()
  my_groups.fadeOut()
)
my_groups.on('click', '#modal_wrapper', (event)->
  my_groups.fadeOut()
)
my_groups.on('click', '#groups_modal_box', (event)->
  event.stopPropagation()
)