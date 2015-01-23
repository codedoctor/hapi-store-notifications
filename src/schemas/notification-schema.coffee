_ = require 'underscore'
mongoose = require 'mongoose'
pluginTimestamp = require "mongoose-plugins-timestamp"
ObjectId = mongoose.Schema.ObjectId

module.exports = NotificationSchema = new mongoose.Schema
      
      ###
      This is the receipient of the notification.
      ###
      owningUserId:
        type: ObjectId
        required: true
        index: true

      ###
      This is the user, if sent on behalf of one
      ###
      fromUserId:
        type: ObjectId
        required: false

      ###
      This is the role that it has been sent from (e.g. a notification for all data-senegal people)
      ###
      involvesRole:
        type: String
        required: false

      ###
      The actual message, as text.
      ###
      message:
        type: String
        required: true

      ###
      Indicates that this message has been read.
      ###
      hasBeenRead:
        type: Boolean
        default: false
        required: true

      messageType:
        type: String
        required: true
        default: 'message'
        enum: ['message']

      ###
      Link shown to the user, if available
      ###
      actionLinkUrl:
        type: String
        required: false
    , 
      strict: true
      collection: 'notification.notifications'


NotificationSchema.plugin pluginTimestamp.timestamps



