do (jQuery) ->

  # @include lib/json_formatter.coffee
  # @include lib/collapser.coffee

  $ = jQuery

  $.fn.JSONView = (json, options = {}) ->
    defaultOptions =
      collapsed: false

    options = $.extend(defaultOptions, options)

    formatter = new JSONFormatter
    # Covert, and catch exceptions on failure
    json = JSON.parse(json) if Object.prototype.toString.call(json) == '[object String]'
    outputDoc = formatter.jsonToHTML(json)

    $(this).html(outputDoc)

    items = $(this)[0].getElementsByClassName('collapsible')
    for item in items
      new Collapser(item.parentNode, options.collapsed) if item.parentNode.nodeName == 'LI'

