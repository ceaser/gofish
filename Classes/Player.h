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
    NSInteger playerID;
    NSInteger fishCount;
    NSString *playerName;
    NSMutableString *status;
}

@property(nonatomic) NSInteger playerID;
@property(retain, nonatomic) NSString *playerName;
@property(nonatomic) NSInteger fishCount;
@property(retain, nonatomic) NSMutableString *status;
@property(retain, nonatomic) NSMutableArray *hand;
@property(retain, nonatomic) Game *game;

-(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName andGameReference:(Game *)gameRef;
-(id)initWithPlayerID:(int)pID andPlayerName:(NSString *)pName;
-(NSInteger)fishFor:(Suit)getSuit;
-(void)drawCardFromDeck;
-(void)writeHand;
-(NSInteger)takeTurn;
-(NSInteger)getSuitCount:(Suit)suit;
-(void)removeSuitFromHand:(Suit)suit;
-(void)addToHandBySuit:(Suit)suit andCount:(int)count;
-(void)writePlayerStatus;
-(void)checkForFullSuit:(Suit)suit;
-(void)verifyHand;
@end

