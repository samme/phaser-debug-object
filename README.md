Phaser Debug Object
===================

Generic object display with `game.debug.object()`.

Use
---

```javascript
game.debug.object(obj, x, y, {
  // Options: (optional; these are defaults)
  color:     'white', // 'auto' to color by value type
  filter:    null,    // (val, key) -> true (include) or false (skip)
  keys:      null,    // ['key', …] : Include only these keys
  label:     null,    // Printed at top
  precision: 2,       // Number precision (decimal digits)
  sort:      false    // Sort by key
});
```
