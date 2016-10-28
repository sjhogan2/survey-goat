$ ->
  $('.survey').on 'submit', (event) ->
    newSurvey = $(this).serialize()
    $.ajax
      url: '/surveys'
      method: 'POST'
      data: newSurvey
      dataType: 'json'
    return

  $('.new-question').on 'submit', (event) ->
    newQuestion = $(this).serialize()
    survey_id = $("input[name='survey_id']").val()
    event.preventDefault()
    $.ajax
      url: '/surveys/' + survey_id + '/questions'
      method: 'POST'
      data: newQuestion
      dataType: 'json'
    return