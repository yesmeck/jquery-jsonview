class Collapser
  constructor: (item, collapsed) ->
    collapser = document.createElement('div')
    collapser.className = 'collapser'
    collapser.innerHTML = if collapsed then '+' else '-'
    collapser.addEventListener('click', ((event) => @collapse(event.target)), false);
    item.insertBefore(collapser, item.firstChild)
    @collapse(collapser) if collapsed

  collapse: (collapser) ->
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

module? && module.exports = Collapser
