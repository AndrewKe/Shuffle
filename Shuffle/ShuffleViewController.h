//
//  ShuffleViewController.h
//  Shuffle
//
//  Created by Andrew Ke on 5/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShuffleViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *shelf; //Contains characters of word displayed on shelf (the brown bar)
- (void) addLetterToShelf: (NSString *)letter;
- (void) removeLetterFromShelf: (NSString *)letter;
@end
