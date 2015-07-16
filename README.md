# electron-debug-symbols
npm module to install electron debug symbols

# usage
```javascript
var minidump = require("minidump");
minidump.addSymbolPath.apply(minidump, require("electron-debug-symbols").paths);

// now when using minidump.walkStack, it would give a more understandable report due to having debug symbols
```

You can use ELECTRON_VERSIONS environment variables to make the module install custom versions, for example when deploying to heroku.
```
heroku config:set ELECTRON_VERSIONS="0.29.2 0.27.1"
```