require 'jasmine-matchers'
SimplePool = require "#{process.cwd()}/lib/simplepool"

describe 'SimplePool', ->

  describe 'constructor', ->

    it 'should create a new Pool with an array as param', ->
      simplepool = new SimplePool(['worker1', 'worker2', 'worker3'])
      expect(simplepool.pool).toEqual(['worker1', 'worker2', 'worker3'])

    it 'should create a new Pool and put all args into the pool', ->
      simplepool = new SimplePool('worker1', 'worker2', 'worker3')
      expect(simplepool.pool).toEqual(['worker1', 'worker2', 'worker3'])


  describe 'add', ->

    it 'should allow adding to the end', ->
      simplepool = new SimplePool ['worker1', 'worker2']
      expect(simplepool.pool).toEqual ['worker1', 'worker2']
      simplepool.add 'worker3'
      expect(simplepool.pool).toEqual ['worker1', 'worker2', 'worker3']

    it 'should add at the given position', ->
      simplepool = new SimplePool ['worker1', 'worker2']
      expect(simplepool.pool).toEqual ['worker1', 'worker2']
      simplepool.add 'worker3', 1
      expect(simplepool.pool).toEqual ['worker1', 'worker3', 'worker2']

    it 'should add to the end if given position is not present', ->
      simplepool = new SimplePool ['worker1', 'worker2']
      expect(simplepool.pool).toEqual ['worker1', 'worker2']
      simplepool.add 'worker3', 10
      expect(simplepool.pool).toEqual ['worker1', 'worker2', 'worker3']

  describe 'remove', ->

    it 'should remove a worker if the worker exists', ->
      simplepool = new SimplePool ['worker1', 'worker2', 'worker3']
      expect(simplepool.pool).toEqual ['worker1', 'worker2', 'worker3']
      simplepool.remove 'worker2'
      expect(simplepool.pool).toEqual ['worker1', 'worker3']

    it 'should remove nothing if this worker is not in the pool', ->
      simplepool = new SimplePool ['worker1', 'worker2', 'worker3']
      expect(simplepool.pool).toEqual ['worker1', 'worker2', 'worker3']
      simplepool.remove 'worker4'
      expect(simplepool.pool).toEqual ['worker1', 'worker2', 'worker3']


  describe 'get', ->

    it 'should get every worker roundrobin', ->
      simplepool = new SimplePool ['worker1', 'worker2', 'worker3']
      expect(simplepool.get()).toEqual('worker1')
      expect(simplepool.get()).toEqual('worker2')
      expect(simplepool.get()).toEqual('worker3')

    it 'should start from the beginning if worker.length is reached', ->
      simplepool = new SimplePool ['worker1', 'worker2', 'worker3']
      expect(simplepool.get()).toEqual('worker1')
      expect(simplepool.get()).toEqual('worker2')
      expect(simplepool.get()).toEqual('worker3')
      expect(simplepool.get()).toEqual('worker1')
      expect(simplepool.get()).toEqual('worker2')
      expect(simplepool.get()).toEqual('worker3')
      expect(simplepool.get()).toEqual('worker1')

  describe 'random', ->

    beforeEach ->
      @addMatchers ->
        toBeOneOf: (expected) ->
          Array.isArray expected and expected.indexOf @actual > -1

    it 'should get a worker by chance', ->
      workers = ['worker1', 'worker2', 'worker3']
      simplepool = new SimplePool workers
      for i in [1..100]
        expect(simplepool.random()).toBeOneOf workers
