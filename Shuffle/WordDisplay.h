//
//  WordDisplay.h
//  Shuffle
//
//  Created by Andrew Ke on 5/24/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

//This class controlls all the little dots seen at the top of the display
#import <UIKit/UIKit.h>

@interface WordDisplay : UIView
@property (strong,nonatomic) NSMutableArray *words; //Array of all words

- (void) revealWord: (NSString *) word; //Turn dots in to the word
- (void) setToLoadingLabel; //Set the text to @"Loading..." when words are being generated
@end
