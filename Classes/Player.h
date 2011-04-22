//
//  Player.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import  "AppConfig.h"
@class Game;// "Game.h"
#import "Player.h"



@interface Player : NSObject {
    //Players have:
    // avatar - player's image
    // moniker - player's nickname
    Game *game;
    NSMutableArray *hand;
    int playerID;
    NSString *playerName;
    NSMutableString *status;
}

@property(assign, readwrite) int playerID;
@property(retain, readwrite) NSString *playerName;
@property(assign, readwrite) int fishCount;
@property(retain, readwrite) NSMutableString *status;
@property(retain, readwrite) NSMutableArray *hand;

-(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName andGameReference:(Game *)gameRef;
-(int)fishFor:(Suit)getSuit;
-(void)drawCardFromDeck;
-(void)writeHand;
-(int)takeTurn;
-(int)getSuitCount:(Suit)suit;
-(void)removeSuitFromHand:(Suit)suit;
-(void)addToHandBySuit:(Suit)suit andCount:(int)count;
-(void)writePlayerStatus;
-(void)checkForFullSuit:(Suit)suit;

@end

