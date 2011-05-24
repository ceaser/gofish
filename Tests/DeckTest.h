//
//  DeckTest.h
//  GoFish
//
//  Created by Eric Barnes on 5/6/11.

//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#define USE_APPLICATION_UNIT_TEST 1

#import "Deck.h"
#import "GTMSenTestCase.h"
#import <UIKit/UIKit.h>
//#import "application_headers" as required


@interface DeckTest : SenTestCase {
    Deck *deckShuffled;
    Deck *deckNotShuffled;
}
@property (retain) Deck *deckShuffled;
@property (retain) Deck *deckNotShuffled;

#if USE_APPLICATION_UNIT_TEST

-(void)setUp;
-(void)testDeckCreation;
-(void)testCreateCards;
-(void)testPlayDeckFullyPopulated;
-(void)testShuffleDeck;
-(void)testDealCard;
-(void)testDeckAfterDealCard;
-(void)testDealCardWithEmptyDeck;

-(void)tearDown;
#else
-(void)testMath;              // simple standalone test
#endif

@end
