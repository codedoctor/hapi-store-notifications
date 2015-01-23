assert = require 'assert'
should = require 'should'
_ = require 'underscore'

fixtures = require './support/fixtures'
loadServer = require './support/load-server'
setupData = require './support/setup-data'

describe 'WHEN index has been loaded', ->
  server = null
  plugin = null

  describe 'ON a clean database', ->
    beforeEach (cb) ->
      loadServer (err,serverResult,pluginResult) ->
        return cb err if err
        server = serverResult
        plugin = pluginResult

        setupData plugin, (err) ->
          cb err

    it 'it should delete an notification', (cb) ->
      plugin.notifications.destroy fixtures.notification1._id, null, (err) ->
        should.not.exist err
        cb err


    it 'it should update an notification', (cb) ->
      plugin.notifications.patch fixtures.notification1._id, {message: 'xxx'}, null, (err,notification) ->
        should.not.exist err
        should.exist notification
        notification.should.have.property 'message','xxx'
        cb err

    it 'it should get an notification', (cb) ->
      plugin.notifications.get fixtures.notification1._id, null, (err,notification) ->
        should.not.exist err
        should.exist notification
        notification.should.have.property 'message',fixtures.notification1.message
        cb err

    it 'it should get all notifications', (cb) ->
      plugin.notifications.all null, (err,notificationsResult) ->
        should.not.exist err
        should.exist notificationsResult
        notificationsResult.should.have.property 'items'
        notificationsResult.items.length.should.equal 3

        cb err

    it 'it should get all notifications for owner', (cb) ->
      plugin.notifications.getForOwner fixtures.userId, null, (err,notificationsResult) ->
        should.not.exist err
        should.exist notificationsResult
        notificationsResult.should.have.property 'items'
        notificationsResult.items.length.should.equal 2

        cb err



