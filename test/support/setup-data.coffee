fixtures = require './fixtures'
async = require 'async'

module.exports = (plugin,cb) ->

  notifications = [fixtures.notification1,fixtures.notification2,fixtures.notification3]
  delete notification._id for notification in notifications

  addAccount = (notificationData,cb) ->
    plugin.notifications.create notificationData,null, (err,notification) ->
      return cb err if err
      notificationData._id = notification._id
      cb null,notification

  async.eachSeries notifications ,addAccount, (err) ->
    cb err
