//
//  ExampleTest.h
//  GoFish
//
//  Created by Eric Barnes on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#define USE_APPLICATION_UNIT_TEST 1

#import "GTMSenTestCase.h"
#import <UIKit/UIKit.h>
#import "Player.h"
#import "Game.h"



@interface PlayerTest : GTMTestCase {
    Player *player0;
    Player *player1;
}


#if USE_APPLICATION_UNIT_TEST
@property (retain) Player *player0;
@property (retain) Player *player1;

-(void)testCheckForFullSuit;
-(void)testRemoveSuitFromHand;
-(void)testGetSuitCount;
-(void)testDrawCardFromDeck;
/*
-(void)testTakeTurn;
-(void)testFishFor;
*/
 #else

#endif

@end
