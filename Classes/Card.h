//
//  Card.h
//  GoFish
//
//  Created by Eric Barnes on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject {
//card is just an instance of a suit?
//card has a suit
//card has an ID? is one needed?
    int suitID;
    NSString *suitName;
    
}

@property (nonatomic, assign) int suitID;
@property (nonatomic, assign) NSString *suitName;

+(void)writeCard:(Card *)card;

@end
