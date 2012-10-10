//
//  main.m
//  versionbump
//
//  Created by Rodney Degracia on 9/9/12.
//  Copyright (c) 2012 Venture Intellectual LLC. 
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "main.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        if (argc < 2) {
            puts("versionbump v1.0\nUsage: versionbump [app-info.plist]");
        } else {
            bump(argv);
        }
        
        
    }
    return 0;
}


int bump(const char* argv[]) {
    
    
    NSString* infoPlist = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:infoPlist];
    //NSLog(@"plist = %@", [plist description]);
    
    if (!plist) {
        NSString* errorString = [NSString stringWithFormat:@"Unable to read %@", infoPlist];
        puts([errorString cStringUsingEncoding:NSUTF8StringEncoding]);
        return -1;
    }
    
    NSString* bundleString = [plist objectForKey:@"CFBundleVersion"];
    if (bundleString == nil) {
        NSString* errorString = [NSString stringWithFormat:@"CFBundleVersion missing from %@", infoPlist];
        puts([errorString cStringUsingEncoding:NSUTF8StringEncoding]);
        return -2;
    }
    
    NSArray* versionNumbers = [bundleString componentsSeparatedByString:@"."];
    if ([versionNumbers count] < 2) {
        NSString* errorString = [NSString stringWithFormat:@"Version convention must be at least major.minor in %@", infoPlist];
        puts([errorString cStringUsingEncoding:NSUTF8StringEncoding]);
        return -3;
    }
    
    //NSLog(@"Version numbers = %@", [versionNumbers description]);
    NSString* buildVersion = [versionNumbers lastObject];
    NSInteger i_buildVersion = [buildVersion integerValue];
    
    BOOL setToZero = ([buildVersion isEqualToString:@"zero"] == YES || [buildVersion isEqualToString:@"x"]);
    if (setToZero == YES) {
        i_buildVersion = 0;
    } else {
        ++i_buildVersion;
    }
    
    NSString* newBuildVersion = [NSString stringWithFormat:@"%ld", (long)i_buildVersion];
    NSMutableArray* newVersionArray = [NSMutableArray arrayWithArray:versionNumbers];
    [newVersionArray removeLastObject];
    [newVersionArray addObject:newBuildVersion];
    
    NSString* newBundleString = [newVersionArray componentsJoinedByString:@"."];
    //NSLog(@"New bundle version = %@", newBundleString);
    
    NSMutableDictionary* newPlist = [NSMutableDictionary dictionaryWithDictionary:plist];
    [newPlist setObject:newBundleString forKey:@"CFBundleVersion"];
    
    //NSLog(@"Writing to %@", infoPlist);
    BOOL result = [newPlist writeToFile:infoPlist atomically:YES];
    
    if (result == NO) {
        NSString* errorString = [NSString stringWithFormat:@"Unable to write to %@", infoPlist];
        puts([errorString cStringUsingEncoding:NSUTF8StringEncoding]);
        return -4;
    }
    
    puts([newBundleString cStringUsingEncoding:NSUTF8StringEncoding]);
    return 0;
}


