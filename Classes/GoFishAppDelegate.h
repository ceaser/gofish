//
//  GoFishAppDelegate.h
//  GoFish
//
//  Created by Ceaser Larry on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoFishViewController;

@interface GoFishAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GoFishViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GoFishViewController *viewController;

@end

