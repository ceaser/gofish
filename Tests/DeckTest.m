//
//  DeckTest.m
//  GoFish
//
//  Created by Eric Barnes on 5/6/11.
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


-(void)setUp
{
    deckShuffled = [[Deck alloc] initWithShuffle:YES];
    deckNotShuffled = [[Deck alloc] initWithShuffle:NO];
}


-(void)testDeckCreation
{
    STAssertNotNil(deckShuffled, @"Deck was not created correctly; The deck object is nil");
    STAssertNotNil(deckNotShuffled, @"Deck was not created correctly; The deck object is nil");
}


-(void)testCreateCards
{
    
    for(NSInteger i = 0; i < (4 * FlyingFish); i++) // 4 cards times the number of suids (FlyingFish is the last suit in the enumeration)
    {
        STAssertTrue([[deckNotShuffled.playDeck objectAtIndex:(i)] isKindOfClass: [Card class]], [NSString stringWithFormat:@"Object at index %i is not a card", i]);
    }
}


- (void)testPlayDeckFullyPopulated
{

    STAssertTrue([deckShuffled.playDeck count] == (4 * FlyingFish), [NSString stringWithFormat:@"deckShuffled was created with less than %i cards", (4 * FlyingFish)]);
    STAssertTrue([deckNotShuffled.playDeck count] == (4 * FlyingFish), [NSString stringWithFormat:@"deckShuffled was created with less than %i cards", (4 * FlyingFish)]);
}


-(void)testShuffleDeck
{
    NSInteger matchCount = 1;
    NSInteger deckCount = [deckNotShuffled.playDeck count];
    for(NSInteger i = 0; i < deckCount; i++)
    {   
        Card *c1 = [deckShuffled.playDeck objectAtIndex:(i)];
        Card *c2 = [deckNotShuffled.playDeck objectAtIndex:(i)];
        
        if(c1.suitID == c2.suitID)
        {
            matchCount += 1;
        }
    }
    
    STAssertTrue(matchCount > 0 && matchCount < deckCount, [NSString stringWithFormat:@"The differences between a shuffled deck (deckShuffled) and an unshuffled deck (deckNotShuffled) should be greater than 0 and less than %i but was %i", deckCount, matchCount]);         
}


-(void)testDeckAfterDealCard
{
    // get card at index 1;
    // remove card at index 0;
    // verify that card at index 0 is now the same as card that used to be at index 1;
    
    for(NSInteger i = 0; i < [deckShuffled.playDeck count] -1; i++)
    {
        Card *origCardAtIndex1 = [deckShuffled.playDeck objectAtIndex:1];
        
        Card *unusedCard = deckShuffled.dealCard;
        unusedCard = nil; // prevent "Unused variable" alert
        
        Card *newCardAtIndex0 = [deckShuffled.playDeck objectAtIndex:0];
        
        STAssertEqualObjects(origCardAtIndex1, newCardAtIndex0, [NSString stringWithFormat:@"The card at index 0 should now be a %s but is a %s instead", origCardAtIndex1.suitName, newCardAtIndex0.suitName]);
    }
}


-(void)testDealCard
{
    NSInteger deckCount = [deckShuffled.playDeck count];
    for(NSInteger i = 0; i < deckCount; i++)
    {
        Card *cardAtIndex0 = [deckShuffled.playDeck objectAtIndex:0];
        Card *deltCard = deckShuffled.dealCard;
        STAssertEqualObjects(cardAtIndex0, deltCard, [NSString stringWithFormat:@"The card at index 0 should now be a %s but is a %s instead", cardAtIndex0.suitName, deltCard.suitName]);
    }
}

-(void)testDealCardWithEmptyDeck
{
    [deckShuffled.playDeck removeAllObjects];
    STAssertTrue([deckShuffled dealCard] == nil, @"Calling deal card on with an empty deck should have returned nil but did not");
}

-(void)tearDown
{
    [deckNotShuffled release];
    [deckShuffled release];
    
    deckShuffled = nil;
    deckNotShuffled = nil;
}

#else
- (void) testMath
{
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}
#endif


@end
