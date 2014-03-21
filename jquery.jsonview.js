(function($) {

  var opts;

  // JSONFormatter json->HTML prototype straight from Firefox JSONView
  // For reference: http://code.google.com/p/jsonview
  function JSONFormatter() {
    // No magic required.
  }

  JSONFormatter.prototype = {
    htmlEncode: function (t) {
      return t != null ? t.toString().replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/</g,"&lt;").replace(/>/g,"&gt;") : '';
    },

    /**
     * Completely escape a json string
     */
    jsString: function(s) {
      // Slice off the surrounding quotes
      s = JSON.stringify(s).slice(1, -1);
      return this.htmlEncode(s);
    },

    decorateWithSpan: function (value, className) {
      return '<span class="' + className + '">' + this.htmlEncode(value) + '</span>';
    },

    // Convert a basic JSON datatype (number, string, boolean, null, object, array) into an HTML fragment.
    valueToHTML: function(value) {
      var valueType = typeof value;

      if (value == null) {
        return this.decorateWithSpan('null', 'null');
      }
      else if (value && value.constructor == Array) {
        return this.arrayToHTML(value);
      }
      else if (valueType == 'object') {
        return this.objectToHTML(value);
      }
      else if (valueType == 'number') {
        return this.decorateWithSpan(value, 'num');
      }
      else if (valueType == 'string') {
        if (/^(http|https|file):\/\/[^\s]+$/i.test(value)) {
          return '<a href="' + this.htmlEncode(value) + '"><span class="q">"</span>' + this.jsString(value) + '<span class="q">"</span></a>';
        } else {
          return '<span class="string">"' + this.jsString(value) + '"</span>';
        }
      }
      else if (valueType == 'boolean') {
        return this.decorateWithSpan(value, 'bool');
      }

      return '';
    },

    // Convert an array into an HTML fragment
    arrayToHTML: function(json) {
      var hasContents = false;
      var output = '';
      var numProps = 0;
      for (var prop in json ) {
        numProps++;
      }

      for ( var prop in json ) {
        hasContents = true;
        output += '<li>' + this.valueToHTML(json[prop]);
        if ( numProps > 1 ) {
          output += ',';
        }
        output += '</li>';
        numProps--;
      }

      if ( hasContents ) {
        output = '<span class="collapser"></span>[<ul class="array collapsible">' + output + '</ul>]';
      } else {
        output = '[ ]';
      }

      return output;
    },

    // Convert a JSON object to an HTML fragment
    objectToHTML: function(json) {
      var hasContents = false;
      var output = '';
      var numProps = 0;
      for ( var prop in json ) {
        numProps++;
      }

      for ( var prop in json ) {
        hasContents = true;
        output += '<li><span class="prop"><span class="q">"</span>' + this.jsString(prop) +
          '<span class="q">"</span></span>: ' + this.valueToHTML(json[prop]);
        if ( numProps > 1 ) {
          output += ',';
        }
        output += '</li>';
        numProps--;
      }

      if ( hasContents ) {
        output = '<span class="collapser"></span>{<ul class="obj collapsible">' + output + '</ul>}';
      } else {
        output = '{ }';
      }

      return output;
    },

    // Convert a whole JSON object into a formatted HTML document.
    jsonToHTML: function(json) {
      var output = '<div id="jsonview">' +
                   this.valueToHTML(json) +
                   '</div>';
      return output;
    },
  };

  $.fn.JSONView = function(jsonObj, options) {

    var defaultOptions = {
      collapsed: false
    }

    options = options || {};

    var opts = $.extend(defaultOptions, options);

    function collapse(collapser) {
      var target = collapser.parentNode.getElementsByClassName('collapsible');

      if ( ! target.length ) {
        return;
      }

      target = target[0];

      if ( target.style.display == 'none' ) {
        var ellipsis = target.parentNode.getElementsByClassName('ellipsis')[0];
        target.parentNode.removeChild(ellipsis);
        target.style.display = '';
        collapser.innerHTML = '-';
      } else {
        target.style.display = 'none';

        var ellipsis = document.createElement('span');
        ellipsis.className = 'ellipsis';
        ellipsis.innerHTML = ' &hellip; ';
        target.parentNode.insertBefore(ellipsis, target);
        collapser.innerHTML = '+';
      }
    }

    function addCollapser(item) {
      // This mainly filters out the root object (which shouldn't be collapsible)
      if ( item.nodeName != 'LI' ) {
        return;
      }

      var collapser = document.createElement('div');
      collapser.className = 'collapser';
      collapser.innerHTML = opts.collapsed ? '+' : '-';
      collapser.addEventListener('click', function(event) {
        collapse(event.target);
      }, false);
      item.insertBefore(collapser, item.firstChild);
      if (opts.collapsed) {
        collapse(collapser);
      }
    }

    var jsonFormatter = new JSONFormatter;
    // Covert, and catch exceptions on failure
    if( Object.prototype.toString.call(jsonObj) !== '[object Object]' ) {
      jsonObj = JSON.parse(jsonObj);
    }
    var outputDoc = jsonFormatter.jsonToHTML(jsonObj);

    $(this).html(outputDoc);

    var items = $(this)[0].getElementsByClassName('collapsible');
    for( var i = 0; i < items.length; i++) {
      addCollapser(items[i].parentNode);
    }
  };

})(jQuery);
