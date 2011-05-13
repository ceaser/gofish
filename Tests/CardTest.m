//
//  CardTest.m
//  GoFish
//
//  Created by Eric Barnes on 5/3/11.
//  Copyright 2011 Marketstar Corp. All rights reserved.
//
#import "CardTest.h"
#import "Card.h"
#import "AppConfig.h"
#import "OCMock/OCMock.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

@implementation CardTest

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application
-(void)setUp
{
    c = [[Card alloc] initWithSuit:ClownFish];
}

- (void)testCardCreation {
    
    
    STAssertTrue(c.suitName == @"ClownFish", @"Card was not created correctly; Bad .suitName" );
    
    STAssertTrue(c.suitID == 1, @"Card was not created correctly; Bad .suitID" );
}

- (void)testSuitToString
{
    
    STAssertTrue([AppConfig suitToString:ClownFish] == @"ClownFish", @"[AppConfig suitToString:ClownFish] did not return the NSString 'ClownFish'");
}

- (void)testSuitToStringWillThowError
{
    STAssertThrows([AppConfig suitToString:999], NSGenericException, @"[AppConfig suitToString:xxx] did not not throw an exception when an invalid suit was passed in.");
}

-(void)tearDown{
    [c release];
    c = nil;
}

#else                           // all code under test must be linked into the Unit Test bundle
                      
- (void) testMath
{
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}



#endif

@end
