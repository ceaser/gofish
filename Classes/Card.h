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
    
    NSInteger suitID;
    NSString *suitName;
    
}

@property (nonatomic) NSInteger suitID;
@property (retain) NSString *suitName;

-(id)initWithSuit:(Suit)suit;
-(void)writeCard;
-(void)assignSuitName;
@end
