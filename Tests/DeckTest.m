//
//  DeckTest.m
//  GoFish
//
//  Created by Ceaser Larry on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "Deck.h"
#import "DeckTest.h"
#import "AppConfig.h"
#import "OCMock/OCMock.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>


@implementation DeckTest

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application
@synthesize deckShuffled;
@synthesize deckNotShuffled;
@synthesize c;

-(void)setUp
{
    deckShuffled = [[Deck alloc] initWithShuffle:YES];
    deckNotShuffled = [[Deck alloc] initWithShuffle:NO];
    c = [[Card alloc] initWithSuit:ClownFish];
}


-(void)testDeckCreation
{
    STAssertNotNil(deckShuffled, @"Deck was not created correctly; The deck object is nil");
    STAssertNotNil(deckNotShuffled, @"Deck was not created correctly; The deck object is nil");
}

-(void)testCreateCards
{
    id card = [OCMockObject mockForClass:[Card class]];
    
    
    //[card andReturn:c];
    
    for(NSInteger i = 0; i < [deckNotShuffled.playDeck count]; i++)
    {
       // STAssertEqualObjects([deckNotShuffled.playDeck objectAtIndex:(i)], card, [NSString stringWithFormat:@"Object at index %i is not a card", i]);
        STAssertEqualObjects([deckNotShuffled.playDeck objectAtIndex:(i)], card, [NSString stringWithFormat:@"Object at index %i is not a card", i]);
    }
    
}


- (void)testPlayDeckFullyPopulated
{
    
}


-(void)tearDown
{
    [deckNotShuffled release];
    [deckShuffled release];
    [c release];
    
    deckShuffled = nil;
    deckNotShuffled = nil;
    c = nil;
}

#else
- (void) testMath
{
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}

#endif


@end
