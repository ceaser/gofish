//
//  PlayerTest.m
//  GoFish
//
//  Created by Eric Barnes on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayerTest.h"
#import "Player.h"
#import "Game.h"
#import "OCMock/OCMock.h"
#import "AppConfig.h"
#import "AppConfig.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

@implementation PlayerTest

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application
/*
 -(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName andGameReference:(Game *)gameRef;
 -(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName;
 -(NSInteger)fishFor:(Suit)getSuit; - done
 -(void)drawCardFromDeck; -- done
 -(void)writeHand;
 -(NSInteger)takeTurn; -- done
 -(NSInteger)getSuitCount:(Suit)suit; -- done
 -(void)removeSuitFromHand:(Suit)suit; -- done
 -(void)addToHandBySuit:(Suit)suit andCount:(int)count;
 -(void)writePlayerStatus;
 -(void)checkForFullSuit:(Suit)suit;
 -(void)verifyHand;
 -(NSInteger)getSuitCount:(Suit)suit
 [self removeSuitFromHand:suit];
 */
@synthesize player0;
@synthesize player1;

-(void)setUp
{
    id mockGame = [OCMockObject mockForClass:[Game class]];
    player0 = [[Player alloc] initWithPlayerID:0 andPlayerName:@"Test Person 0" andGameReference:mockGame];
    player1 = [[Player alloc] initWithPlayerID:1 andPlayerName:@"Test Person 1" andGameReference:mockGame];
    
    //populate player's hand
    //add 3 FlyingFish to each player's hand
    for(NSInteger i = 0; i < 3; i++)
    {
        Card  *c = [[Card alloc] initWithSuit:FlyingFish];
        [player0.hand addObject:c];
        [player1.hand addObject:c];
        [c release];
        c = nil;
    }
    
    //add 1 of each suit to each player's hand
    for(NSInteger i = 1; i <= FlyingFish; i++)
    {
        Card  *c = [[Card alloc] initWithSuit:i];
        [player0.hand addObject:c];
        [player1.hand addObject:c];
        [c release];
        c = nil;
    }
}

-(void)testCheckForFullSuit
{
    NSInteger suitCount = 0;
    
    for(Card *c in player0.hand) 
    {
        if(c.suitID == FlyingFish)
        {
            suitCount ++;
        }
    }
    STAssertTrue(suitCount == 4, @"Test Problem:  The suitCount must be 4 for this test to function");
    
    [player0 checkForFullSuit:FlyingFish];
    suitCount = 0;
    for(Card *c in player0.hand) 
    {
        if(c.suitID == FlyingFish)
        {
            suitCount ++;
        }
    }
    STAssertTrue(suitCount == 0, [NSString stringWithFormat:@"There should have been 0 cards of the given suit but there were %i", suitCount]);
}


-(void)testRemoveSuitFromHand
{
    NSInteger suitCount = 0;
    
    for(Card *c in player0.hand) 
    {
        if(c.suitID == FlyingFish)
        {
            suitCount ++;
        }
    }
    STAssertGreaterThan(suitCount, 0, @"Test Problem:  The suitCount must greater than 0 for this test to function");
    
    [player0 checkForFullSuit:FlyingFish];
    suitCount = 0;
    for(Card *c in player0.hand) 
    {
        if(c.suitID == FlyingFish)
        {
            suitCount ++;
        }
    }
    STAssertTrue(suitCount == 0, [NSString stringWithFormat:@"There should have been 0 cards of the given suit but there were %i", suitCount]);
}

-(void)testGetSuitCount
{   
    NSInteger suitCount = [player0 getSuitCount:FlyingFish];
    STAssertTrue(suitCount == 4, [NSString stringWithFormat:@"There should have been 4 FlyingFish in the player's hand, but %i where found", suitCount]);
    
    suitCount = [player0 getSuitCount:ClownFish];
    STAssertTrue(suitCount == 1, [NSString stringWithFormat:@"There should have been 1 ClownFish in the player's hand, but %i were found", suitCount]);
}

-(void)testDrawCardFromDeck
{
    /*
     Card *c = [self.game drawCardFromDeck];
     
     if([c isKindOfClass:[Card class]])
     {
     [hand addObject:c];
     self.status = [NSMutableString stringWithFormat:@" drew a %@ from the game deck", [c suitName]];
     [self checkForFullSuit:c.suitID];
     }
     else
     {
     self.status = [NSMutableString stringWithFormat:@" cannot draw a card because the deck is out of cards"];
     }
     
     [self writePlayerStatus];
     [self verifyHand];
     */
    
    Card *c = [[Card alloc] initWithSuit:FlyingFish];
    [player0.hand addObject:c];
    STAssertEqualObjects([player0.hand lastObject], c, @"The card added to the player's hand was NOT the card drawn from the game deck");
    
}


-(void)tearDown
{
    [player0 release];
    [player1 release];
    
    player0 = nil;
    player1 = nil;
}

#else


#endif


@end
