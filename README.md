# simple-pool

Ever wanted to add e.g. some workers to a simple Pool, doing a simple distributing/loadbalancing? there are great modules like [generic-pool](https://npmjs.org/package/generic-pool) out there if you want do a real loadbalancing and pooling.

If you just need a simple distribution solution, simple-pool is exactly what you want!

## Getting Started

$ npm install simple-pool

require it in your code, and use it:

```javascript
var SimplePool = require('simple-pool');
var pool = new SimplePool([x, y, z]);
pool.get();
```

## Examples

see the examples-directory!

## Documentation

api-docs: (open doc/index.html in your browser)

### Include it in your Code

```javascript
var SimplePool = require('simple-pool');
```

### Create a new Pool

#### With an Array as Argument

```javascript
var pool = new SimplePool([x, y, z]);
```

#### With as much Arguments as you want

```javascript
var pool = new SimplePool(x, y, z);
```

### Add more to your Pool

#### Add it to the End of your Pool

```javascript
pool.add(a);
```

#### Add it add the given Position of your Pool

```javascript
pool.add(a, 2);
```

_hint:_ if the Position is missing, it will add it to the End

### Remove from your Pool

```javascript
pool.remove(x);
```

### Get From the Pool

#### Get Roundrobin

```javascript
pool.get(); // returns the first Object
pool.get(); // returns the second Object
...
```

#### Get a Object by Chance

```javascript
pool.random();
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/):

## Release History

- 0.1.0 Initial Release

## Contributors

- Bastian "hereandnow" Behrens

## License
Copyright (c) 2013 Valiton GmbH
Licensed under the MIT license.