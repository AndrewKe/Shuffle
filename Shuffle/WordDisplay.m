//
//  WordDisplay.m
//  Shuffle
//
//  Created by Andrew Ke on 5/24/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "WordDisplay.h"

@interface WordDisplay()
@property (weak,nonatomic) IBOutlet UITextView *dotsLabel; //textview displaying the dots representing words
@property (strong,nonatomic) NSMutableArray *dotsArray; //Array with dots in it
@end

@implementation WordDisplay

- (void) awakeFromNib{
    [self setToLoadingLabel];
}

- (void)setWords:(NSMutableArray *)words{ //Override setter of property
    _words = words;
    self.dotsLabel.text = @"";
    self.dotsArray = [[NSMutableArray alloc] init];
    for(NSString *word in _words){ //Gradually generate dots to fill up self.dotsLabel
        NSString *dots = @"";
        for(int i=0; i<[word length]; i++){
            dots = [dots stringByAppendingString:@"•"];
        }
        dots = [dots stringByAppendingString:@" "];
        [self.dotsArray addObject:dots];
        self.dotsLabel.text = [self.dotsLabel.text stringByAppendingString:dots];
    }
    self.dotsLabel.textAlignment = NSTextAlignmentCenter; //Center the text (Is this a bug in iOS 7?)
    self.dotsLabel.font = [UIFont fontWithName:@"DINAlternate-Bold" size:10.0];
}

- (void) setToLoadingLabel{
    NSLog(@"setToLoadingLabel called");
    self.dotsLabel.text = @"Loading...";
    self.dotsLabel.textAlignment = NSTextAlignmentCenter;
    self.dotsLabel.textColor = [UIColor colorWithRed:0.42 green:0.26 blue:0.3 alpha:1.0];
    self.dotsLabel.font = [UIFont fontWithName:@"DINAlternate-Bold" size:20.0];
}

- (void) revealWord:(NSString *)word{
    int location = [self.words indexOfObject:word];
    self.dotsArray[location] = word;
    [self.dotsLabel setText:[self.dotsArray componentsJoinedByString:@" "]];
    self.dotsLabel.textAlignment = NSTextAlignmentCenter;
    self.dotsLabel.font = [UIFont fontWithName:@"DINAlternate-Bold" size:10.0];
}
@end
