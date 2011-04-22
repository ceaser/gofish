//
//  Card.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"


@interface Card : NSObject {
    
    int suitID;
    NSString *suitName;
    
    
}

@property (nonatomic, assign) int suitID;
@property (nonatomic, assign) NSString *suitName;

-(id)initWithSuit:(Suit)suit;
-(void)writeCard;
@end
