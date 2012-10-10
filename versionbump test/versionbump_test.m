//
//  versionbump_test.m
//  versionbump test
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

#import "versionbump_test.h"
#import "main.h"

@implementation versionbump_test

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    
    NSFileManager* filemgr = [[NSFileManager alloc] init];
    
    NSString* currentpath = [filemgr currentDirectoryPath];
    
    NSString* infoPlist = @"test-Info.plist";
    NSString* plistPath = [NSString stringWithFormat:@"%@/versionbump test/%@", currentpath, infoPlist ];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"string, %s", cString);
    
    const char* argv[] =  { "versionbump",cString};
    int result = bump(argv);
    
    STAssertTrue(result == 0, @"Should be no errors");
}

@end
