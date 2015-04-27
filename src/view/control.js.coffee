class CB.Control extends CB.View
  constructor: (frame) ->
    super(frame)
    @items = []

  beginTrackingWithEvent: (event) ->

  continueTrackingWithEvent: (event) ->

  endTrackingWithEvent: (event) ->

  cancelTrackingWithEvent: (event) ->

  @property "readonly", "tracking"

  @property "readonly", "touchOrPointInside"

  @property "readonly", "state"

  @property "enabled"

  @property "selected"

  @property "highlighted"

  @property "contentVerticalAlignment"

  @property "contentHorizontalAlignment"

  sendActionToForEvent: (action, target, event) ->
    target[action](this, event)

  sendActionsForControlEvents: (controlEvents) ->
    items = @items.filter (i) ->
      i.controlEvents == controlEvents
    for item in items
      sendActionToForEvent(item.action, item.target, null)

  # tentative implementation which only accept single event
  addTargetActionForControlEvents: (target, action, controlEvents) ->
    @items.push(target: target, action: action, controlEvents: controlEvents)

  # tentative implementation which only accept single event
  removeTargetActionForControlEvents: (target, action, controlEvents) ->
    @items.forEach (i) =>
      if i.target == target and i.action == action and i.controlEvents == controlEvents
        index = @items.indexOf(i)
        @items.splice(index, 1)

  actionsForTargetForControlEvent: (target, controlEvent) ->
  allTargets: () ->
  allControlEvents: () ->


  touchesBeganWithEvent: (event) ->
    @tracking = true
    this.beginTrackingWithEvent(event)

  touchesMovedWithEvent: (event) ->
    if @tracking
      this.continueTrackingWithEvent(event)

  touchesEndedWithEvent: (event) ->
    if @tracking
      @tracking = false
      this.endTrackingWithEvent(event)

  touchesCanceledWithEvent: (event) ->
    if @tracking
      @tracking = false
      this.cancelTrackingWithEvent(event)

  mouseDownWithEvent: (event) ->
    @tracking = true
    this.beginTrackingWithEvent(event)

  mouseMovedWithEvent: (event) ->
    if @tracking
      this.continueTrackingWithEvent(event)

  mouseUpWithEvent: (event) ->
    if @tracking
      @tracking = false
      this.endTrackingWithEvent(event)

  mouseExitedWithEvent: (event) ->
    if @tracking
      @tracking = false
      this.cancelTrackingWithEvent(event)
