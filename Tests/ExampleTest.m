//
//  ExampleTest.m
//  GoFish
//
//  Created by Ceaser Larry on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExampleTest.h"
#import "OCMock/OCMock.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

@implementation ExampleTest

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application

- (void) testAppDelegate
{    
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
    
}


- (void) testOCMock
{
	id mock = [OCMockObject mockForClass:[NSString class]];
	[mock verify];
}


- (void) testHamcrest
{
	NSString *string1 = @"String1";
	NSString *string2 = @"String1";
	
    assertThat(string1, equalTo(string2));
}

#else
- (void) testMath
{
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}

#endif


@end
