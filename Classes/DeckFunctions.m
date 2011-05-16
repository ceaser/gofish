//
//  Deck.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DeckFunctions.h"
#import "Card.h"

@implementation DeckFunctions
/*
    +(id) init {
        self = [super init];
        return self;

}
 */

NSMutableArray *playDeck;

+(void) prepareDeck{
    [self createCards];
    #ifndef NDEBUG
        [self writeDeck:playDeck];
    #endif
    [self shuffleDeck];
    #ifndef NDEBUG
        [self writeDeck:playDeck];
    #endif
}

+(void) createCards{
    NSMutableArray *deck = [NSMutableArray array];
    // *LAME* is there a better way to do this?
    for (int currentSuit = ClownFish; currentSuit <= FlyingFish; ++currentSuit)
    { 
        Card *c = [Card new];
        c.suitID = currentSuit;
        c.suitName = [self suitToString:currentSuit];
        //add 4 of each suit
        for(int i = 0; i < 4; i++)
        {
            [deck addObject:c];
        }
        playDeck = deck;
    }
}

+(void) shuffleDeck{
    
    srandom(time(NULL)); //seed random num generator//
     
    NSUInteger n = [playDeck count];
    while(n > 1)
    {
        NSUInteger k = rand() % n;
        n--;
        [playDeck exchangeObjectAtIndex:n withObjectAtIndex:k];
    }
}

+(void) writeDeck:(NSMutableArray *)deck{
    for(int i = 1; i < [deck count]; i++)
    {
        [Card writeCard:(Card *)[deck objectAtIndex:i]];
    }
}

+(NSMutableArray *)getPlayDeck{
    [self prepareDeck];
    return playDeck;
} 

+(NSString *)suitToString:(Suit)currentSuit {
    NSString *result = nil;
    
    switch(currentSuit) {
        case ClownFish:
            result = @"ClownFish";
            break;
        case SwordFish:
            result = @"SwordFish";
            break;
        case ParrotFish:
            result = @"ParrotFish";
            break;
        case GoldFish:
            result = @"GoldFish";
            break;
        case LionFish:
            result = @"LionFish";
            break;
        case CatFish:
            result = @"CatFish";
            break;
        case FlyingFish:
            result = @"FlyingFish";
            break;
        default:
            [NSException raise:NSGenericException format:@"Problem -> Unexpected suit type."];
    }
    
    return result;
}

@end