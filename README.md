![Screenshot](https://samme.github.io/phaser-debug-object/screenshot.png)

Use
---

```javascript
game.debug.object(obj, x, y, {
  // Options: (optional; these are defaults)
  boldLabel: true,
  color:     'white', // 'auto' to color by value type
  filter:    null,    // (val, key) -> true (include) or false (skip)
  keys:      null,    // ['key', …] : Include only these keys
  label:     null,    // Printed at top
  precision: 2,       // Number precision (decimal digits)
  sort:      false    // Sort by key
});
```
