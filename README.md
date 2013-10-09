phonegap-plugin-ExtractZip
==========================

Now it supports Android and iOS within Phonegap 3.

there are two methods:

* extract(fileName, destination)
* getTempDir(name)

Installing
======
You may use phonegap CLI as follows:

<pre>
➜ phonegap local plugin add https://github.com/fiscal-cliff/phonegap-plugin-ExtractZip.git
[phonegap] adding the plugin: https://github.com/fiscal-cliff/phonegap-plugin-ExtractZip.git
[phonegap] successfully added the plugin
</pre>

Using
====
```javascript
		document.addEventListener('deviceready', onDeviceReady);
		function onDeviceReady() {
			document.body.style.background = 'red'
			window.zip = cordova.require('cordova.plugin.ExtractZip.ExtractZip');
		}
		function extractZip(fileName) {
			zip.extract(fileName, '/sdcard/', win, fail);
		}
		function getTempDir(dirName) {
			zip.getTempDir(dirName, win, fail);
		}
		function win(status) {
			alert('Message: ' + status);
		}
		function fail(status) {
			alert('Error: ' + status);
		}
```
