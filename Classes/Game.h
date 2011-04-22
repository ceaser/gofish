//
//  Game.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "Player.h"


@interface Game : NSObject {
    // games have:
    // players - game participants
    // playDeck - array of cards to "fish" from
    // turn - player whose turn it is
    // timer - turn timout timer
    // methods
    // deal cards
    NSMutableArray *playerList;
    Deck *deck;
}

@property(retain, readwrite) Deck *deck;
@property(retain, readwrite) NSMutableArray *playerList;

-(void) showWinner:(Player *)player;
-(Player *) startGameLoop; 
-(void) createPlayers;
-(void) writePlayers;
-(void) dealCards;
-(void) writePlayersHands;
-(Card *) drawCardFromDeck;
-(NSMutableArray *)getPlayerList;
-(int) fishForSuit:(Suit)suit fromPlayerID:(int)playerID;


@end 


