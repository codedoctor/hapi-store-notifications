(function() {
  var NotificationMethods, ObjectId, mongoose, mongooseRestHelper, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _ = require('underscore-ext');

  mongoose = require("mongoose");

  ObjectId = mongoose.Types.ObjectId;

  mongooseRestHelper = require('mongoose-rest-helper');


  /*
  Provides methods to interact with notifications
   */

  module.exports = NotificationMethods = (function() {
    var UPDATE_EXCLUDEFIELDS;

    UPDATE_EXCLUDEFIELDS = ['_id', 'createdByUserId', 'createdAt', 'updatedAt'];


    /*
    Initializes a new instance of the @see NotificationMethods class.
    @param {Object} models A collection of models that can be used.
     */

    function NotificationMethods(models) {
      this.models = models;
      this.create = __bind(this.create, this);
      this.patch = __bind(this.patch, this);
      this.destroy = __bind(this.destroy, this);
      this.get = __bind(this.get, this);
      this.getForOwner = __bind(this.getForOwner, this);
      this.all = __bind(this.all, this);
    }


    /*
    Retrieve a list of notifications.
     */

    NotificationMethods.prototype.all = function(options, cb) {
      var settings;
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      settings = {
        baseQuery: {},
        defaultSort: '-dateCreated',
        defaultSelect: null,
        defaultCount: 50
      };
      return mongooseRestHelper.all(this.models.Notification, settings, options, cb);
    };

    NotificationMethods.prototype.getForOwner = function(userId, options, cb) {
      var settings;
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      settings = {
        baseQuery: {
          owningUserId: new ObjectId(userId.toString())
        },
        defaultSort: '-dateCreated',
        defaultSelect: null,
        defaultCount: 50
      };
      return mongooseRestHelper.all(this.models.Notification, settings, options, cb);
    };


    /*
    Retrieve a single notification.
     */


    /*
    Retrieve a notification matching the notificationId
     */

    NotificationMethods.prototype.get = function(notificationId, options, cb) {
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      if (!notificationId) {
        return cb(new Error("notificationId parameter is required."));
      }
      return mongooseRestHelper.getById(this.models.Notification, notificationId, null, options, cb);
    };


    /*
    Physically deletes this notification.
     */

    NotificationMethods.prototype.destroy = function(notificationId, options, cb) {
      var settings;
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      if (!notificationId) {
        return cb(new Error("notificationId parameter is required."));
      }
      settings = {};
      return mongooseRestHelper.destroy(this.models.Notification, notificationId, settings, {}, cb);
    };

    NotificationMethods.prototype.patch = function(notificationId, obj, options, cb) {
      var settings;
      if (obj == null) {
        obj = {};
      }
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      if (!notificationId) {
        return cb(new Error("notificationId parameter is required."));
      }
      settings = {
        exclude: UPDATE_EXCLUDEFIELDS
      };
      return mongooseRestHelper.patch(this.models.Notification, notificationId, settings, obj, options, cb);
    };


    /*
    Creates a new notification.
     */

    NotificationMethods.prototype.create = function(objs, options, cb) {
      var settings;
      if (objs == null) {
        objs = {};
      }
      if (options == null) {
        options = {};
      }
      if (cb == null) {
        cb = function() {};
      }
      settings = {};
      return mongooseRestHelper.create(this.models.Notification, settings, objs, options, cb);
    };

    return NotificationMethods;

  })();

}).call(this);

//# sourceMappingURL=notification-methods.js.map
