/**
 * @name simple-pool
 * @description Simple Pooling Module
 * @author Valiton GmbH, Bastian "hereandnow" Behrens
*/

/**
 * 3rd library imports
*/

var SimplePool, randomInt,
  __slice = [].slice;

randomInt = require('random-tools').randomInt;

module.exports = SimplePool = (function() {
  /**
   * create a new SimplePool instance
   *
   * @memberOf global
   *
   * @constructor
   * @this {SimplePool}
  */

  function SimplePool() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    this.current = 0;
    this.pool = args.length === 1 && Array.isArray(args[0]) ? args[0] : args;
  }

  /**
   * add something to this pool
   *
   * @param {*} obj add anything you want here
   * @function global.SimplePool.prototype.add
   * @returns {this} the current instance for chaining
  */


  SimplePool.prototype.add = function(obj, position) {
    if (position == null) {
      this.pool.push(obj);
    } else {
      this.pool.splice(position, 0, obj);
    }
    return this;
  };

  /**
   * remove something from the pool
   *
   * @param {*} obj which should be removed
   * @function global.SimplePool.prototype.remove
   * @returns {this} the current instance for chaining
  */


  SimplePool.prototype.remove = function(obj) {
    var index;
    index = this.pool.indexOf(obj);
    if (index > -1) {
      this.pool.splice(index, 1);
    }
    return this;
  };

  /**
   * get the next obj from the pool (roundrobin)
   *
   * @function global.SimplePool.prototype.get
   * @returns {*} obj the next obj in the pool
  */


  SimplePool.prototype.get = function() {
    var obj;
    obj = this.pool[this.current];
    this.current += 1;
    if (this.current === this.pool.length) {
      this.current = 0;
    }
    return obj;
  };

  /**
   * get the next obj from the pool (per chance)
   *
   * @function global.SimplePool.prototype.random
   * @returns {*} obj a random obj
  */


  SimplePool.prototype.random = function() {
    return this.pool[randomInt(this.pool.length - 1)];
  };

  /**
   * get all objects from the pool
   *
   * @function global.SimplePool.prototype.all
   * @returns {array} pool the total pool array
  */


  SimplePool.prototype.all = function() {
    return this.pool;
  };

  return SimplePool;

})();
