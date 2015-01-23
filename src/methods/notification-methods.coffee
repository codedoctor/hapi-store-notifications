_ = require 'underscore-ext'

mongoose = require "mongoose"
ObjectId = mongoose.Types.ObjectId
mongooseRestHelper = require 'mongoose-rest-helper'

###
Provides methods to interact with notifications
###
module.exports = class NotificationMethods
  UPDATE_EXCLUDEFIELDS = ['_id','createdByUserId','createdAt','updatedAt']

  ###
  Initializes a new instance of the @see NotificationMethods class.
  @param {Object} models A collection of models that can be used.
  ###
  constructor:(@models) ->

  ###
  Retrieve a list of notifications.
  ###
  all: (options = {},cb = ->) =>
    settings = 
        baseQuery: {}
        defaultSort: '-dateCreated'
        defaultSelect: null
        defaultCount: 50
    mongooseRestHelper.all @models.Notification,settings,options, cb


  getForOwner: (userId,options = {}, cb = ->) =>
    settings = 
        baseQuery: 
          owningUserId: new ObjectId userId.toString()
        defaultSort: '-dateCreated'
        defaultSelect: null
        defaultCount: 50
    mongooseRestHelper.all @models.Notification,settings,options, cb

  ###
  Retrieve a single notification.
  ###
  ###
  Retrieve a notification matching the notificationId
  ###
  get: (notificationId, options = {}, cb = ->) =>
    return cb new Error "notificationId parameter is required." unless notificationId
    mongooseRestHelper.getById @models.Notification,notificationId,null,options, cb

  ###
  Physically deletes this notification.
  ###
  destroy: (notificationId, options = {}, cb = ->) =>
    return cb new Error "notificationId parameter is required." unless notificationId
    settings = {}
    mongooseRestHelper.destroy @models.Notification,notificationId, settings,{}, cb


  patch: (notificationId, obj = {}, options = {}, cb = ->) =>
    return cb new Error "notificationId parameter is required." unless notificationId
    settings =
      exclude : UPDATE_EXCLUDEFIELDS
    mongooseRestHelper.patch @models.Notification,notificationId, settings, obj, options, cb

  ###
  Creates a new notification.
  ###
  create: (objs = {},options = {},cb = ->) =>
    settings = {}
    mongooseRestHelper.create @models.Notification,settings,objs,options,cb

