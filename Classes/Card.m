//
//  Card.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Card.h"
#import "AppConfig.h"


@implementation Card
-(id)initWithSuit:(Suit)suit {
    self = [super init];
    suitID = suit;

    [self assignSuitName];
    
    return self;
    
}

@synthesize suitID;
@synthesize suitName;      


-(void)writeCard{
    NSLog(@"suitID: %d, suitname: %@", suitID, suitName);
}

-(void)assignSuitName{
    self.suitName = [AppConfig suitToString:self.suitID];
}
@end