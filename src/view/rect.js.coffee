class CB.Rect

  constructor: (x, y, width, height) ->
    @_origin = new CB.Point(x, y)
    @_size = new CB.Size(width, height)

  @property "readonly", "origin"

  @property "readonly", "size"

  @property "readonly", "x",
    get: -> @origin.x

  @property "readonly", "y",
    get: -> @origin.y

  @property "readonly", "width",
    get: -> @size.width

  @property "readonly", "height",
    get: -> @size.height

  equals: (rhs) ->
    @origin.equals(rhs.origin) and @size.equals(rhs.size)

  copy: ->
    new CB.Rect(@x, @y, @width, @height)

  @provided Equalable, Copyable
