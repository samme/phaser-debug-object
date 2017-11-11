"use strict"

{Date, Object, Phaser, RegExp} = this

{isArray} = Array

AUTO     = "auto"
FUNCTION = "function"
NUMBER   = "number"
OBJECT   = "object"
WHITE    = "white"

aqua =    "#7fdbff"
blue =    "#0074d9"
fuchsia = "#f012be"
gray =    "#666666"
lime =    "#01ff70"
orange =  "#ff851b"
purple =  "#b10dc9"
red =     "#ff4136"
silver =  "#aaaaaa"
white =   "#ffffff"
yellow =  "#ffdc00"

colors =
  boolean   : orange
  date      : purple
  default   : white
  function  : blue
  nan       : red
  null      : silver
  number    : yellow
  regexp    : fuchsia
  special   : aqua
  string    : lime
  undefined : gray

defaultOptions =
  boldLabel: yes
  color: WHITE,
  filter: null
  keys: null
  label: null
  precision: 2
  sort: no

colorForValue = (val) ->
  typ = typeof val

  switch
    when val is null
      colors.null
    when val isnt val
      colors.nan
    when val instanceof Date
      colors.date
    when val instanceof RegExp
      colors.regexp
    when typ is OBJECT and val.constructor isnt Object
      colors.special
    else
      colors[typ] or colors.default

defaults = (target) ->
  for key, val of defaultOptions when not (key of target)
    target[key] = val
  target

formatValue = (val, precision) ->
  typ = typeof val

  switch
    when isArray val
      "(#{val.length})"
    when typ is NUMBER
      (if val % 1 then val.toFixed(precision) else val)
    when (val instanceof Date), (val instanceof RegExp)
      val.toString()
    when typ is OBJECT and val?.constructor?.name
      val.constructor.name
    when typeof val is FUNCTION
      "[function #{val.name}]"
    when val?.toString
      val.toString()
    else
      val

Phaser.Utils.Debug::object = (obj, x, y, options = {}) ->
  options = defaults options

  {boldLabel, color, filter, keys, label, map, precision} = options
  {currentColor, font} = this

  if color is AUTO
    color = null
    colorize = yes

  color ?= WHITE

  keys ?= Object.keys obj

  keys.sort() if options.sort

  if map
    obj = obj.map map

  @start x, y, color

  if label
    @context.font = "bold #{font}" if boldLabel
    @line label
    @context.font = font if boldLabel

  for key in keys
    val = obj[key]
    continue if filter and not filter(val, key)
    @currentColor = (colorize and colorForValue(val)) or color
    @line "#{key}: #{formatValue val, precision}"

  @stop()

  @currentColor = currentColor

  return
