do (jQuery) ->
  jQuery.fn.JSONView = (json, opttions = {}) ->
    defaultOptions =
      collapsed: false

    options = $.extend(defaultOptions, options)

    collapse = (collapser) ->
      target = collapser.parentNode.getElementsByClassName('collapsible')
      return unless target.length
      target = target[0]

      if target.style.display == 'none'
        ellipsis = target.parentNode.getElementsByClassName('ellipsis')[0]
        target.parentNode.removeChild(ellipsis)
        target.style.display = ''
        collapser.innerHTML = '-'
      else
        target.style.display = 'none'
        ellipsis = document.createElement('span')
        ellipsis.className = 'ellipsis'
        ellipsis.innerHTML = ' &hellip; '
        target.parentNode.insertBefore(ellipsis, target)
        collapser.innerHTML = '+'

    addCollapser = (item) ->
      # This mainly filters out the root object (which shouldn't be collapsible)
      return if item.nodeName != 'LI'

      collapser = document.createElement('div')
      collapser.className = 'collapser'
      collapser.innerHTML = if opttions.collapsed then '+' else '-'
      collapser.addEventListener('click', ((event)-> collapse(event.target)), false);
      item.insertBefore(collapser, item.firstChild)
      collapse(collapser) if (opttions.collapsed)

    formatter = new JSONFormatter
    # Covert, and catch exceptions on failure
    json = JSON.parse(json) if Object.prototype.toString.call(json) == '[object String]'
    outputDoc = formatter.jsonToHTML(json)

    $(this).html(outputDoc)

    items = $(this)[0].getElementsByClassName('collapsible')
    for item in items
      addCollapser(item.parentNode)

