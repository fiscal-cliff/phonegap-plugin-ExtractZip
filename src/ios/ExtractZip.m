//
//  ExtractZipFilePlugin.m
//
//  Created by Shaun Rowe on 10/05/2012.
//  Copyright (c) 2012 Pobl Creative Cyf. All rights reserved.
//

#import "ExtractZip.h"
#import "SSZipArchive.h"

@implementation ExtractZip


- (void)extract:(CDVInvokedUrlCommand *)command
{
    NSArray* arguments = command.arguments;
    
    NSLog(@"Extract zip has been started.");
    NSString *file = [arguments objectAtIndex:0];
    NSString *destination = [arguments objectAtIndex:1];

    CDVPluginResult *result;
    if([SSZipArchive unzipFileAtPath:file toDestination:destination delegate:nil]) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[destination stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [self writeJavascript:[result toSuccessCallbackString:command.callbackId]];
        NSLog(@"Success!");
    } else {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[@"Could not extract archive" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [self writeJavascript:[result toErrorCallbackString:command.callbackId]];
        NSLog(@"Error!");
    }
}

- (void)getTempDir:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
    NSError* error = nil;
    
    NSString* dirName = [command.arguments objectAtIndex:0];
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* dirPath = [path stringByAppendingPathComponent:dirName];
    
    NSLog(@"Trying to create directory: %@",dirName);
    bool isCreated = ![[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:NO attributes:nil error: &error];
    
    if (isCreated) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:dirPath];
        NSLog(@"Success!");
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't create the directory."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end