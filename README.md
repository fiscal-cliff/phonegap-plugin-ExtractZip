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
      function extractFile(fileName)
      {
	      var zip = new ExtractZip();
	      zip.extract('/sdcard/'+fileName,'/sdcard/',win,fail,'ExtractZipFilePlugin');
      }
      function getTempDir(dirName)
      {
	      var zip = new ExtractZip();
	      zip.getTempDir(dirName,win,fail,'ExtractZipFilePlugin');
      }
      function win(status) 
      { 
	      alert('Message: '+status);
      } 
      function fail(error) 
      { 
	      alert(error);
      }
```
