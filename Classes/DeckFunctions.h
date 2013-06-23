//
//  Deck.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface DeckFunctions : NSObject {
    
}

typedef enum {ClownFish = 1, SwordFish, ParrotFish, GoldFish, LionFish, CatFish, FlyingFish} Suit;

+(void)prepareDeck;
+(void)createCards;
+(void)shuffleDeck;
+(NSString *)suitToString:(Suit)currentSuit;
+(NSMutableArray *)getPlayDeck;
+(void)writeDeck:(NSMutableArray *)deck;
@end
