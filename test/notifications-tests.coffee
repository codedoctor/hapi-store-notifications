assert = require 'assert'
should = require 'should'
_ = require 'underscore'

fixtures = require './support/fixtures'
loadServer = require './support/load-server'

describe 'WHEN index has been loaded', ->
  server = null
  plugin = null

  describe 'ON a clean database', ->
    beforeEach (cb) ->
      loadServer (err,serverResult,pluginResult) ->
        return cb err if err
        server = serverResult
        plugin = pluginResult

        cb null


    it 'it should create an notification', (cb) ->
      plugin.notifications.create fixtures.notification1, null, (err,notification) ->
        should.not.exist err
        should.exist notification
        cb err



