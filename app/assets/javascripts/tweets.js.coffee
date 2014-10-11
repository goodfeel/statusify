# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#tweet_tweet').on 'input', ->
    if $("#tweet_tweet").val().length > 141
      $('#status_counter').text((141 - $("#tweet_tweet").val().length)).addClass('text-red')
    else
      $('#status_counter').text($("#tweet_tweet").val().length + "/141").removeClass('text-red')
