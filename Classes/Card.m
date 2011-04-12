//
//  Card.m
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Card.h"


@implementation Card
+(id) init {
    self = [super init];
    
    return self;
    
}
    @synthesize suitID;
    @synthesize suitName;      

+(void)writeCard:(Card *)card{
    NSLog(@"suitID: %i  suitName: %@", card.suitID, card.suitName);    
}

@end