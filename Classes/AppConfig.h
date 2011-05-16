//
//  AppConfig.h
//  GoFish
//
//  Created by Eric Barnes on 4/13/11.
//  Copyright 2011 Marketstar Corp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppConfig : NSObject {
    
    
    
}
typedef enum {ClownFish = 1, SwordFish, 
    //ParrotFish, GoldFish, LionFish, CatFish, 
    FlyingFish
} Suit;

+(NSString *)suitToString:(Suit)currentSuit;
@end
