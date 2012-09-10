//
//  versionbump_test.m
//  versionbump test
//
//  Created by Rodney Degracia on 9/9/12.
//  Copyright (c) 2012 Venture Intellectual LLC. All rights reserved.
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
