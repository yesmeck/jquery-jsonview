# jQuery JSONView

[![OpenCollective](https://opencollective.com/jquery-jsonview/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/jquery-jsonview/sponsors/badge.svg)](#sponsors)

Formats & syntax highlights JSON.

Port of Ben Hollis's JSONView extension for Firefox: http://jsonview.com

[Live demo](http://yesmeck.github.io/jquery-jsonview/)

## Usage

### Example

```javascript
var json = {"hey": "guy","anumber": 243,"anobject": {"whoa": "nuts","anarray": [1,2,"thr<h1>ee"], "more":"stuff"},"awesome": true,"bogus": false,"meaning": null, "japanese":"明日がある。", "link": "http://jsonview.com", "notLink": "http://jsonview.com is great"};

$(function() {
  $("#json").JSONView(json);
  // with options
  $("#json-collasped").JSONView(json, { collapsed: true });
});
```

### Options

jQuery JSONView can be configured using the following options.

* `collapsed` - Collapse all nodes when rendering first time, default is `false`.
* `nl2br` - Convert new line to `<br>` in String, default is `false`.
* `recursive_collapser` - Collapse nodes recursively, default is `false`.
* `escape` - Escape HTML in key, default is `true`.
* `strict` - In strict mode, invalid JSON value type will throw a error, default is `false`.

### API

jQuery JSONView provide following methods to allow you control JSON nodes, all methods below accept a level argument to perform action on the specify node.

* `jQuery#JSONView('collapse', [level])` - Collapse nodes.
* `jQuery#JSONView('expand', [level])` - Expand nodes.
* `jQuery#JSONView('toggle', [level])` -  Toggle nodes.


## Contributors

This project exists thanks to all the people who contribute.
<a href="graphs/contributors"><img src="https://opencollective.com/jquery-jsonview/contributors.svg?width=890" /></a>


## Backers

Thank you to all our backers! 🙏 [[Become a backer](https://opencollective.com/jquery-jsonview#backer)]

<a href="https://opencollective.com/jquery-jsonview#backers" target="_blank"><img src="https://opencollective.com/jquery-jsonview/backers.svg?width=890"></a>


## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/jquery-jsonview#sponsor)]

<a href="https://opencollective.com/jquery-jsonview/sponsor/0/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/1/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/2/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/3/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/4/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/5/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/6/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/7/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/8/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/jquery-jsonview/sponsor/9/website" target="_blank"><img src="https://opencollective.com/jquery-jsonview/sponsor/9/avatar.svg"></a>


## License

[MIT](http://opensource.org/licenses/MIT)
