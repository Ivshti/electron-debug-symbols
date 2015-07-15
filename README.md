# electron-debug-symbols
npm module to install electron debug symbols

# usage
```javascript
var minidump = require("minidump");
minidump.addSymbolPath.apply(minidump, require("electron-debug-symbols").paths);

// now when using minidump.walkStack, it would give a more understandable report due to having debug symbols
```
