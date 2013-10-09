/*
 * @author Evgeniy Lukovsky
 * */

cordova.define("cordova/plugin/ExtractZip", function(require, exports, module) {
	var exec = require('cordova/exec');

	var ExtractZip=function(){
	};

	ExtractZip.prototype.extract = function(file, dest, successCallback, errorCallback) 
	{
		return cordova.exec(successCallback, errorCallback, "ExtractZip", "extract", [file,dest]);
	};

	ExtractZip.prototype.getTempDir = function(dirName, successCallback, errorCallback) 
	{
		return cordova.exec(successCallback, errorCallback, "ExtractZip", "getTempDir", [dirName]);
	};

	module.exports= new ExtractZip();

});
