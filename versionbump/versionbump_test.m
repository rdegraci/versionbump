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

#import <XCTest/XCTest.h>
#import "main.h"

@interface versionbump_test : XCTestCase

@end

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


- (void)testIsReleaseCandidate {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    const char* argv[] =  { "versionbump", "--rc", cString};
    
    bool result = isReleaseCandidate(3, argv);
    
    XCTAssertTrue(result == true, @"Should be no errors");
}


- (void)testIsSingleBuildNumber {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    const char* argv[] =  { "versionbump", "--single", cString};
    
    bool result = isSingleBuildNumber(3, argv);
    
    XCTAssertTrue(result == true, @"Should be no errors");
}


- (void)testBump
{
    
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"string, %s", cString);
    
    const char* argv[] =  { "versionbump",cString};
    int result = bump(2, argv);
    
    XCTAssertTrue(result == 0, @"Should be no errors");
}

- (void)testRCBump
{
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"string, %s", cString);
    
    const char* argv[] =  { "versionbump", "--rc", cString};
    int result1 = bump(3, argv);
    
    XCTAssertTrue(result1 == 0, @"Should be no errors");
    
    int result2 = rcBuildNumber(3, argv);
    
    XCTAssertTrue(result2 == 0, @"Should be no errors");
}


- (void)testSingleBuildBump
{
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info2" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"string, %s", cString);
    
    const char* argv[] =  { "versionbump", "--single", cString};
    int result = singleBuildBump(3, argv);
    
    XCTAssertTrue(result == 0, @"Should be no errors");
}

- (void)testSingleBuildBumpWithRC
{
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [bundle pathForResource:@"test-Info2" ofType:@"plist"];
    
    
    const char *cString = [plistPath cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"string, %s", cString);
    
    const char* argv[] =  { "versionbump", "--single", "-rc", cString};
    int result1 = rcSingleBuildNumber(4, argv);
    
    XCTAssertTrue(result1 == 0, @"Should be no errors");
    
}


@end
