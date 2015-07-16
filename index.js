var path = require("path");
var fs = require("fs");

var paths = [__dirname+"/symbols/win32/electron.breakpad.syms", __dirname+"/symbols/darwin/electron.breakpad.syms", __dirname+"/symbols/linux/electron.breakpad.syms"];
try { 
	paths = fs.readdirSync(__dirname+"/symbols").map(function(x) { return path.join(__dirname+"/symbols", x) });
} catch(e) { }

module.exports = { paths: paths };