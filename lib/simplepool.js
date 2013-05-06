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
   * @param {*} worker add anything you want here
   * @function global.SimplePool.prototype.add
   * @returns {this} the current instance for chaining
  */


  SimplePool.prototype.add = function(worker, position) {
    if (position == null) {
      this.pool.push(worker);
    } else {
      this.pool.splice(position, 0, worker);
    }
    return this;
  };

  /**
   * remove something from the pool
   *
   * @param {*} worker which should be removed
   * @function global.SimplePool.prototype.remove
   * @returns {this} the current instance for chaining
  */


  SimplePool.prototype.remove = function(worker) {
    var index;
    index = this.pool.indexOf(worker);
    if (index > -1) {
      this.pool.splice(index, 1);
    }
    return this;
  };

  /**
   * get the next worker from the pool (roundrobin)
   *
   * @function global.SimplePool.prototype.get
   * @returns {*} the next worker
  */


  SimplePool.prototype.get = function() {
    var worker;
    worker = this.pool[this.current];
    this.current += 1;
    if (this.current === this.pool.length) {
      this.current = 0;
    }
    return worker;
  };

  /**
   * get the next worker from the pool (per chance)
   *
   * @function global.SimplePool.prototype.random
   * @returns {*} a random worker
  */


  SimplePool.prototype.random = function() {
    return this.pool[randomInt(this.pool.length - 1)];
  };

  return SimplePool;

})();
