//
//  ExtractZipFilePlugin.h
//
//  Created by Shaun Rowe on 10/05/2012.
//  Copyright (c) 2012 Pobl Creative Cyf. All rights reserved.
//

#import <Cordova/CDV.h>
#import "SSZipArchive.h"

@interface ExtractZip : CDVPlugin
{
    NSString *callbackID;
}

- (void)extract:(CDVInvokedUrlCommand*)command;
- (void)getTempDir:(CDVInvokedUrlCommand*)command;

@end
