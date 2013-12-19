# jQuery JSONView

Formats & syntax highlights JSON.

Port of Ben Hollis's JSONView extension for Firefox: http://jsonview.com

## Usage

```javascript
// View a json format string
var data = '{"hey": "guy","anumber": 243,"anobject": {"whoa": "nuts","anarray": [1,2,"thr<h1>ee"], "more":"stuff"},"awesome": true,"bogus": false,"meaning": null, "japanese":"明日がある。", "link": "http://jsonview.com", "notLink": "http://jsonview.com is great"}';

// Or view a object
// var data = {"hey": "guy","anumber": 243,"anobject": {"whoa": "nuts","anarray": [1,2,"thr<h1>ee"], "more":"stuff"},"awesome": true,"bogus": false,"meaning": null, "japanese":"明日がある。", "link": "http://jsonview.com", "notLink": "http://jsonview.com is great"};

$(function() {
  $("#data").JSONView(data);
  // with options
  // $("#data").JSONView(data, {collapsed: true});
});
```

[Demo](http://blog.yesmeck.com/jquery-jsonview/)


## Options

```javascript
{
  collapsed: false
}
```

## Licence

MIT
