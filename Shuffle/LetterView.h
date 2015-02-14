//
//  LetterView.h
//  Shuffle
//
//  Created by Andrew Ke on 5/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIBox.h"
#import "ShuffleViewController.h"
@interface LetterView : UIBox
//Properties
@property (nonatomic) BOOL selected; //Tells whether tile is selected or not
@property (strong,nonatomic) ShuffleViewController *selectionDelegate; //Used to tell VC when tiles are selected
@property (strong,nonatomic) NSString *letter;
- (void) turnOn;
- (void) turnOff;
@end
