###*
 * @name simple-pool
 * @description Simple Pooling Module
 * @author Valiton GmbH, Bastian "hereandnow" Behrens
###


###*
 * 3rd library imports
###
randomInt = require('random-tools').randomInt

module.exports = class SimplePool

  ###*
   * create a new SimplePool instance
   *
   * @memberOf global
   *
   * @constructor
   * @this {SimplePool}
  ###
  constructor: (args...) ->
    @current = 0
    @pool = if args.length is 1 and Array.isArray args[0] then args[0] else args


  ###*
   * add something to this pool
   *
   * @param {*} obj add anything you want here
   * @function global.SimplePool.prototype.add
   * @returns {this} the current instance for chaining
  ###
  add: (obj, position) ->
    unless position?
      @pool.push obj
    else
      @pool.splice position, 0, obj
    this


  ###*
   * remove the given obj from the pool
   *
   * @param {*} obj which should be removed
   * @function global.SimplePool.prototype.remove
   * @returns {this} the current instance for chaining
  ###
  remove: (obj) ->
    index = @pool.indexOf obj
    if index > -1
      @pool.splice index, 1
    this


  ###*
   * get the next obj from the pool (roundrobin)
   *
   * @function global.SimplePool.prototype.get
   * @returns {*} obj the next obj in the pool
  ###
  get: ->
    obj = @pool[@current]
    @current += 1
    @current = 0 if @current is @pool.length
    obj


  ###*
   * get the next obj from the pool (per chance)
   *
   * @function global.SimplePool.prototype.random
   * @returns {*} obj a random obj
  ###
  random: ->
    @pool[randomInt @pool.length - 1]


  ###*
   * get all objects from the pool
   *
   * @function global.SimplePool.prototype.all
   * @returns {array} pool the total pool array
  ###
  all: ->
    @pool
