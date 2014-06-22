//
//  Player.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.[
//

//#import "Player.h"
#import "AppConfig.h"
#import "Card.h"
#import "Game.h"


@implementation Player

-(id)initWithPlayerID:(NSInteger)pID andPlayerName:(NSString *)pName andGameReference:(Game *)gameRef{
    self = [super init];
    playerID = pID;
    playerName = pName;
    game = gameRef;
    hand = [NSMutableArray array];
    
#ifndef NDEBUG
    self.status = [NSMutableString stringWithString:@" created"];
    [self writePlayerStatus];
#endif   
    return self;
}


-(id)initWithPlayerID:(NSInteger)pID andPlayerName:(NSString *)pName{
    self = [super init];
    playerID = pID;
    playerName = pName;
    hand = [NSMutableArray array];
    
#ifndef NDEBUG
    self.status = [NSMutableString stringWithString:@" created"];
    [self writePlayerStatus];
    [self verifyHand];
#endif   
    return self;
}

@synthesize playerID;
@synthesize playerName;
@synthesize fishCount;
@synthesize status;
@synthesize hand;
@synthesize game;


/*
    1.  Pick random opponent (not self)
    2.  Pick random suit (owned by self)
    3.  Get cards of the picked suit from the picked opponent
    4.  Add cards to hand if any were found
    5.  Draw card from deck if no cards were found
*/
-(NSInteger)takeTurn{

#ifndef NDEBUG
    [self verifyHand];
    self.status = [NSMutableString stringWithString:@" is taking turn"]; 
    [self writePlayerStatus];
    NSInteger opponentPlayerID = -1;
#endif 
    // pick player (excluding self)
    do {
        opponentPlayerID = (arc4random() % [[game getPlayerList] count]);
    } while (opponentPlayerID == self.playerID); // pick again if opponent is self
    
    // pick random suit from within cards in hand
    Card * c = [self.hand objectAtIndex:(arc4random() % ([self.hand count]))];
    
    Suit suit = c.suitID;
    self.fishCount = 0;
    self.fishCount = [game fishForSuit:suit fromPlayerID:opponentPlayerID];
    
#ifndef NDEBUG
    self.status = [NSMutableString stringWithFormat:@" fished for %@ from playerID %d and found %d fish", [AppConfig suitToString:suit], opponentPlayerID, self.fishCount];
    [self writePlayerStatus];
#endif 
    
    // if suit is found check for 4 of a suit and take another turn
    if(self.fishCount > 0)
    {
        [self addToHandBySuit:suit andCount:fishCount];
        [self checkForFullSuit:(Suit)suit];
        
        [self takeTurn];
    }
    else
    {
        [self drawCardFromDeck];
    }
    return [hand count];
}


-(NSInteger)fishFor:(Suit)suit{
#ifndef NDEBUG
    self.status = [NSMutableString stringWithFormat:@" is getting fished for %@", [AppConfig suitToString:suit]];
    [self writePlayerStatus];
#endif 
    
    
    NSInteger suitCount = [self getSuitCount:suit];
    
    if(suitCount > 0)
    {
        [self removeSuitFromHand:suit];
    }
    else
    {
        NSLog(@"no fish found");
    }
    [self verifyHand];
    return suitCount;
}


-(void)removeSuitFromHand:(Suit)suit{
    
    self.status = [NSMutableString stringWithFormat:@" is removing all %@ from hand", [AppConfig suitToString:suit]];
    [self writePlayerStatus];
    
    NSMutableArray *removeCards = [NSMutableArray new];
    for(Card *c in self.hand)
    {
        [self verifyHand];
        if(c.suitName == [AppConfig suitToString:suit])
        {
            [removeCards addObject:c];
        }            
    }
    [self.hand removeObjectsInArray:removeCards]; 
    [removeCards release];
    
#ifndef NDEBUG
    [self verifyHand];
    self.status = [NSMutableString stringWithFormat:@" now has %d cards left.", [self.hand count]];
    [self writePlayerStatus];
    [self writeHand];
#endif 
    
    
}

-(void)addToHandBySuit:(Suit)suit andCount:(NSInteger)count{
    self.status = [NSMutableString stringWithFormat:@" is adding %d %@ to hand", count, [AppConfig suitToString:suit]];
    [self writePlayerStatus];
    [self writeHand];
    
    
    for(NSInteger i = 0; i < count; i++)
    {
        Card *c = [[Card alloc] initWithSuit:suit];
        [hand addObject:c];
        [c release];
        c = nil;
        [self verifyHand];

    }
    [self verifyHand];
}

-(NSInteger)getSuitCount:(Suit)suit{
    NSInteger suitCount = 0;
    
    for(Card *c in self.hand) 
    {
        if(c.suitName == [AppConfig suitToString:suit])
        {
            suitCount ++;
        }
        
    }
    return suitCount;
}

- (void) checkForFullSuit:(Suit)suit
{
    
    if([self getSuitCount:suit] == 4)
    { 
        self.status = [NSMutableString stringWithFormat:@" caught all 4 %@.", [AppConfig suitToString:suit]];
        [self writePlayerStatus];
        [self removeSuitFromHand:suit];
    }
    else if([self getSuitCount:suit] > 4)
    {
        self.status = [NSMutableString stringWithFormat:@"ERROR**** there more than 4 instances of a suit in a hand"];
        [self writePlayerStatus];
    }
    
}

// takes a card from the deck and adds it to the players hand
-(void)drawCardFromDeck{
    
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
}

-(void)writePlayerStatus{
    NSLog(@"Player ""%@"" id: %d %@", playerName, playerID, self.status);
    self.status = nil;
}


-(void)writeHand{
    self.status = [NSMutableString stringWithFormat:@" has %i cards.  hand:", [self.hand count]]; 
    [self writePlayerStatus];
    
    for(Card *c in self.hand)
    {
        [c writeCard];
    }
    
}


-(void)verifyHand
{

    for(NSInteger i = 0; i < [self.hand count]; i++)
    {
        if(![[self.hand objectAtIndex:i] isKindOfClass:[Card class]])
        {
            self.status = [NSMutableString stringWithFormat:@" has a bad card at index %d", i]; 
            [self writePlayerStatus];
        }
    }


}
@end
