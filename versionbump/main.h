//
//  main.h
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

#ifndef versionbump_main_h
#define versionbump_main_h

int main(int argc, const char * argv[]);
int bump(int argc, const char* argv[]);
int singleBuildBump(int argc, const char* argv[]);
int rcBuildNumber(int argc, const char* argv[]);
int rcSingleBuildNumber(int argc, const char* argv[]);
bool isReleaseCandidate(int argc, const char* argv[]);
bool isSingleBuildNumber(int argc, const char* argv[]);
#endif
