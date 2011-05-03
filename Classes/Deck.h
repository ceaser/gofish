//
//  Deck.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "AppConfig.h"


@interface Deck : NSObject {    
    
    NSMutableArray *playDeck;
    
}


@property (nonatomic, retain) NSMutableArray *playDeck;

@end

@interface Deck()

-(void) writeDeck;    
-(void) shuffleDeck;
-(void) createCards;
-(Card *) dealCard;


@end

