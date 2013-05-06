# run this from your project-directory like this:
# $ coffee examples/simple-pool.coffee

SimplePool = require "#{process.cwd()}/lib/simplepool"

config = {}

simplepool = new SimplePool()
simplepool.init config
