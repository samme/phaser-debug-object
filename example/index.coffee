"use strict"

window.GAME = new (Phaser.Game)(
  antialias: no
  height: 2000
  # renderer: Phaser.AUTO
  # resolution: 1
  # scaleMode: Phaser.ScaleManager.NO_SCALE
  # transparent: false
  width: 800
  state:

    init: ->
      {debug} = @game

      debug.font = "20px 'Input Mono', monospace"
      debug.lineHeight = 25

      @game.forceSingleUpdate = off
      # @time.desiredFps = 30

      return

    create: ->
      @obj =
        boolean   : true
        date      : new Date
        function  : ->
        nan       : NaN
        null      : null
        number    : Math.PI
        object    : {}
        regexp    : /:-}/
        string    : ":-("
        undefined : undefined
        point     : new Phaser.Point
        rect      : new Phaser.Rectangle
        image     : @make.image()

      @stanza = [
        "Twas brillig, and the slithy toves"
        "Did gyre and gimble in the wabe:"
        "All mimsy were the borogoves,"
        "And the mome raths outgrabe."
      ]

      # @game.enableStep()
      return

    update: ->

    render: ->
      {debug} = @game

      x = 20
      y = 20

      debug.object @obj, x, y,
        color: "auto"
        sort: yes

      debug.object @stanza, x, y += 400

      debug.object @game, x, y += 200,
        color: "auto"
        # filter: (val, key) -> not key.startsWith "_"
        # keys: Object.getOwnPropertyNames @game
        sort: yes

      return

    shutdown: ->
)
