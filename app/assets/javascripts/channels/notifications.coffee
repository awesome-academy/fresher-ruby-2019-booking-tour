App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->

  disconnected: ->

  received: (data) -> 
    $('#notificationList').prepend("#{data.activity}")
    $('#open_notification').html(data.counter)