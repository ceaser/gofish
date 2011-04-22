//
//  GoFishViewController.h
//  GoFish
//
//  Created by Ceaser Larry on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface GoFishViewController : UIViewController {
    
    Game *g;
}

-(IBAction)soloGame;

@end