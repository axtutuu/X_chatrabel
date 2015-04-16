$(document).on 'change', '#user_prefecture', ->
  $.ajax(
    type: 'GET'
    url: '/users/cities_select'
    data: {
      prefecture_id: $(":selected").val()
    }
  ).done (data) ->
    $('#cities_select').html(data)
