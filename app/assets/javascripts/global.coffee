jQuery(document).on 'turbolinks:load', ->
  answers = $('#answers')
  count = answers.find('.count > span')

  recount = -> count.text answers.find('.nested-fields').size()

  answers.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  answers.on 'cocoon:after-insert', (e, added_el) ->
    recount()

  answers.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  answers.on 'cocoon:after-remove', (e, removed_el) ->
    recount()