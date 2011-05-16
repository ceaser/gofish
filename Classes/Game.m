//
//  Game.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Player.h"
#import "Deck.h"
#import "Card.h"


@implementation Game

-(id)init{
    self = [super init];
#ifndef NDEBUG
    NSLog(@"Game Initialized");
#endif
    deck = [[Deck alloc] initWithShuffle:NO];
    return self;
} 

@synthesize deck;
@synthesize playerList;

-(void)createPlayers{
    NSMutableArray *players = [NSMutableArray array];
    
    // will eventually want to loop and create 5 players
<<<<<<< HEAD
    for(int i = 0; i < 5; i++)
=======
    for(int i = 0; i < 2; i++)
>>>>>>> 8633c7714ee825b662136690c51470e48a5ba657
    {
        Player *player = [[Player alloc] initWithPlayerID:i andPlayerName:@"NoName"];
        player.game = self;
        [players addObject:player];
        [player release];
        player = nil;
    }
    playerList = players;
    [self dealCards];
#ifndef NDEBUG
    [self writePlayersHands];
#endif
}

-(NSMutableArray *)getPlayerList{
    return playerList;
}


-(void)showWinner:(Player *)player{
    NSLog(@"And the winner is....%@, %d", player.playerName, player.playerID);
}


-(Player *)startGameLoop{
#ifndef NDEBUG
    NSLog(@"Starting Game Loop");
#endif
    Player *winner = NULL;
    
    while (winner == NULL) 
    {
        for(Player *player in playerList)
        {
            //player = player;
            // if card count is zero, set the winning player
            if([player takeTurn] == 0)
            {
                winner = player;
            }
        }
    }
    return winner;
}


-(void)writePlayers{
    
    for(Player *p in playerList)
    {
        [p writePlayerStatus];
    }
}

-(void)writePlayersHands{
    for(Player *p in playerList)
    {
        [p writeHand];
    }
}

// deal 5 cards to each player
-(void)dealCards{
    for(int i = 0; i < 5; i++)
    {
        for(Player *player in playerList)
        {
            [player drawCardFromDeck];
        }
    }
}

-(int)fishForSuit:(Suit)suit fromPlayerID:(int)playerID
{
    Player *player = [self.playerList objectAtIndex:playerID];
    //int fishCount = [player fishFor:suit];
    //return the number of fish found
    return [player fishFor:suit];
}

-(Card *)drawCardFromDeck{
    
    return [deck dealCard];
}

@end

