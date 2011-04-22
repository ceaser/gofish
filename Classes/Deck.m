//
//  Deck.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
#import "AppConfig.h"


@implementation Deck

-(id) init {
    self = [super init];
    [self createCards];
#ifndef NDEBUG
    NSLog(@"New Deck");
    [self writeDeck];
#endif
    [self shuffleDeck];
#ifndef NDEBUG
    NSLog(@"Shuffled Deck");
    [self writeDeck];
#endif
    return self;
}

@synthesize playDeck;

-(void) createCards{
    NSMutableArray *deck = [NSMutableArray array];
    // *LAME* is there a better way to do this?
    for (int suit = ClownFish; suit <= FlyingFish; ++suit)
    { 
        Card *c = [[Card alloc] initWithSuit:(Suit)suit];
        //add 4 of each suit
        for(int i = 0; i < 4; i++)
        {
            [deck addObject:c];
        }
        playDeck = deck;
        [c release];
    }
}

-(void) shuffleDeck{
    
    int n = [playDeck count];
    while(n > 1)
    {
        NSUInteger k = arc4random() % n;
        n--;
        [playDeck exchangeObjectAtIndex:n withObjectAtIndex:k];
    }
}

-(void) writeDeck{
    for(Card *c in playDeck)
    {
        [c writeCard];
    }
}

-(Card *) dealCard
{
    if([self.playDeck count] > 0)
    {
        Card *c = [playDeck objectAtIndex:(0)];
        [playDeck removeObjectAtIndex:(0)];
        return c;
    }
    else
    {
        return nil;
    }      
}



@end