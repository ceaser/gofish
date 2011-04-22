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

-(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName andGameReference:(Game *)gameRef{
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

@synthesize playerID;
@synthesize playerName;
@synthesize fishCount;
//@synthesize opponent;
@synthesize status;
@synthesize hand;



-(int)takeTurn{
#ifndef NDEBUG
    self.status = [NSMutableString stringWithString:@" is taking turn"]; 
    [self writePlayerStatus];
    int opponentPlayerID = 0;
#endif 
    // pick player (excluding self)
    do {
        opponentPlayerID = (arc4random() % [[game getPlayerList] count]);
    } while (opponentPlayerID == self.playerID); // try again if opponent is self
    
    // pick suit -- FlyingFish is last fish in deck/suit enum
    Suit suit = (arc4random() % (FlyingFish)) +1;
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


-(int)fishFor:(Suit)suit{
#ifndef NDEBUG
    self.status = [NSMutableString stringWithFormat:@" is getting fished for %@", [AppConfig suitToString:suit]];
    [self writePlayerStatus];
#endif 
    

    int suitCount = [self getSuitCount:suit];
    
    if(suitCount > 0)
    {
        [self removeSuitFromHand:suit];
    }
    return suitCount;
}


-(void)removeSuitFromHand:(Suit)suit{
    
    self.status = [NSMutableString stringWithFormat:@" is removing all %@ from hand", [AppConfig suitToString:suit]];
    [self writePlayerStatus];
    
    NSMutableArray *removeCards = [NSMutableArray new];
    for(Card *c in self.hand)
    {
        if(c.suitName == [AppConfig suitToString:suit])
        {
            [removeCards addObject:c];
        }            
    }
    [self.hand removeObjectsInArray:removeCards]; 
    [removeCards release];
    
#ifndef NDEBUG
    self.status = [NSMutableString stringWithFormat:@" now has %d cards left.", [self.hand count]];
    [self writePlayerStatus];
    [self writeHand];
#endif 
    
}

-(void)addToHandBySuit:(Suit)suit andCount:(int)count{
    self.status = [NSMutableString stringWithFormat:@" is adding %d %@ to hand", count, [AppConfig suitToString:suit]];
    [self writePlayerStatus];  
    
    
    for(int i = 0; i < count; i++)
    {
        Card *c = [[Card alloc] initWithSuit:suit];
        [hand addObject:c];
        [c release];
    }
}

-(int)getSuitCount:(Suit)suit{
    int suitCount = 0;
    
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
    
    Card *c = [game drawCardFromDeck];
    if(c != nil)
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
@end
