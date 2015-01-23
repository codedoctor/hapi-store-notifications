_ = require 'underscore'
mongoose = require 'mongoose'

NotificationSchema = require './schemas/notification-schema'

NotificationMethods = require './methods/notification-methods'

module.exports = class Store

  ###
  Initializes a new instance of the {Store}
  @param [Object] settings configuration options for this store
  @option settings [Function] initializeSchema optional function that is called with the schema before it is converted to a model.
  @option settings [Boolean] autoIndex defaults to true and updates the db indexes on load. Should be off for production.
  ###
  constructor: (@settings = {}) ->
    _.defaults @settings, 
                  autoIndex : true
                  initializeSchema: (schema) -> 

    @schemas = [
      NotificationSchema
    ]

    @settings.initializeSchema schema for schema in @schemas
    schema.set 'autoIndex', @settings.autoIndex for schema in @schemas

    m = mongoose
    m = @settings.connection if @settings.connection

    @models =
      Notification: m.model "Notification", NotificationSchema
    
    @notifications = new NotificationMethods @models

    @methodNames = [
        'notifications'
      ]


