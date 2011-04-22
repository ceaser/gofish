//
//  AppConfig.m
//  GoFish
//
//  Created by Eric Barnes on 4/13/11.
//  Copyright 2011 Marketstar Corp. All rights reserved.
//

#import "AppConfig.h"


@implementation AppConfig

// Should probably be moved to Deck class
+(NSString *)suitToString:(Suit)currentSuit {
    NSString *result = nil;
    
    switch(currentSuit) {
        case ClownFish:
            result = @"ClownFish";
            break;
        case SwordFish:
            result = @"SwordFish";
            break;
        case ParrotFish:
            result = @"ParrotFish";
            break;
        case GoldFish:
            result = @"GoldFish";
            break;
        case LionFish:
            result = @"LionFish";
            break;
        case CatFish:
            result = @"CatFish";
            break;
        case FlyingFish:
            result = @"FlyingFish";
            break;
        default:
            [NSException raise:NSGenericException format:@"Problem -> Unexpected suit type."];
    }
    
    return result;
}

@end


