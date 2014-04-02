do (jQuery) ->

  # @include lib/json_formatter.coffee
  # @include lib/collapser.coffee

  $ = jQuery

  $.fn.JSONView = ->
    METHODS = { collapse: 'hide', expand: 'show', toggle: 'toggle' }

    args = arguments

    if METHODS[args[0]]?
      # it's method call
      method = METHODS[args[0]]

      @each ->
        $this = $(this)
        if args[1]?
          if Object.prototype.toString.call(args[1]) == '[object Number]'
            # collapse/expand by node level
            level = args[1]
            $this.find(".jsonview .level#{level}")[method]()
          else
            # collapse/extend by keychain
            keychain = args[1]
            $this.find(".jsonview #jsonview#{keychain}")[method]()
        else
          # no key/level specify? collapse/expand all!
          $this.find('.jsonview > ul > li > .collapsible')[method]()

    else
      json = args[0]
      options = args[1] || {}

      defaultOptions =
        collapsed: false

      options = $.extend(defaultOptions, options)

      formatter = new JSONFormatter
      # Covert, and catch exceptions on failure
      json = JSON.parse(json) if Object.prototype.toString.call(json) == '[object String]'
      outputDoc = formatter.jsonToHTML(json)

      @each ->
        $this = $(this)

        $this.html(outputDoc)

        items = $this[0].getElementsByClassName('collapsible')

        for item in items
          new Collapser(item.parentNode, options.collapsed) if item.parentNode.nodeName == 'LI'

