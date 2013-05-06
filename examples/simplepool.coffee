# run this from your project-directory like this:
# $ coffee examples/simple-pool.coffee

SimplePool = require "#{process.cwd()}/lib/simplepool"

simplepool = new SimplePool(['obj1', 'obj2'])
simplepool.get()
