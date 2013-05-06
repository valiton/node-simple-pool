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
   * @param {*} worker add anything you want here
   * @function global.SimplePool.prototype.add
   * @returns {this} the current instance for chaining
  ###
  add: (worker, position) ->
    unless position?
      @pool.push worker
    else
      @pool.splice position, 0, worker
    this


  ###*
   * remove something from the pool
   *
   * @param {*} worker which should be removed
   * @function global.SimplePool.prototype.remove
   * @returns {this} the current instance for chaining
  ###
  remove: (worker) ->
    index = @pool.indexOf worker
    if index > -1
      @pool.splice index, 1
    this


  ###*
   * get the next worker from the pool (roundrobin)
   *
   * @function global.SimplePool.prototype.get
   * @returns {*} the next worker
  ###
  get: ->
    worker = @pool[@current]
    @current += 1
    @current = 0 if @current is @pool.length
    worker


  ###*
   * get the next worker from the pool (per chance)
   *
   * @function global.SimplePool.prototype.random
   * @returns {*} a random worker
  ###
  random: ->
    @pool[randomInt @pool.length - 1]


