Phaser Debug Object
===================

Generic object display with `game.debug.object()`.

Use
---

```javascript
game.debug.object(obj, x, y, {
  // options (default):
  color: 'white', // 'auto' to color by value type
  filter: null,   // (val, key) -> true (include) or false (skip)
  keys: null,     // ['key', …] include only these keys
  label: null,    // printed at top
  precision: 2,   // Number precision (decimal digits)
  sort: false     // sort by key
});
```
