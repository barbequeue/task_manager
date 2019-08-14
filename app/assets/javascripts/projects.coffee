$(document).on 'turbolinks:load', ->

  $('body').on 'ajax:success', (event) ->
    if event.target.tagName != 'FORM'
      return

    form = event.target

    input = $(form).find('.form__text-input')
    input.removeClass('form__text-input_invalid')
    input.siblings('.form__error-message').html('')
    return

  $('body').on 'ajax:error', (event) ->
    if event.target.tagName != 'FORM'
      return

    form = event.target

    errors = event.detail[0]
    Object.keys(errors).forEach (error) ->
      input = $(form).find("[name*='[#{error}]']")
      input.addClass('form__text-input_invalid')
      input.siblings('.form__error-message').html(errors[error])
      return
    return

  return
