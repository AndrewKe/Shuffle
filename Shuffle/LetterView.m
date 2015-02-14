//
//  LetterView.m
//  Shuffle
//
//  Created by Andrew Ke on 5/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "LetterView.h"

@interface LetterView()
@property (weak,nonatomic) UILabel *characterView;
@end

@implementation LetterView



- (void) awakeFromNib{ //Called at beginning of UIViewLifeCycle
    [super awakeFromNib];
    [self subSetUp];
    
}

- (instancetype)init{
    self = [super init];
    [self subSetUp];
    return self;
}

- (void) subSetUp{//Sub means subclass (We don't want to overide our super class's (UIBox) setUp code)
    UITapGestureRecognizer *letterTappedGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(letterTapped:)];
    [self addGestureRecognizer:letterTappedGestureRecognizer];//Add a gesture recognizer to detect when letter is clicked
    
    //Create Label that Displays Letter
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
    label.text = @"";
    label.font = [UIFont fontWithName:@"DINAlternate-Bold" size:39];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    self.characterView = label;
    UIColor *peach = [UIColor colorWithRed:1.0 green:0.8 blue:0.4 alpha:1.0];
    self.backgroundColor = peach;
}

/*- (void) setSelected:(BOOL)selected{
    if(selected){
        self.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
    }else{
        self.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.4 alpha:1.0];
    }
}*/


- (void)letterTapped:(UITapGestureRecognizer *) gestureRecognizer{ //When the letter is clicked


    if(!self.selected){//Switch to determine right color
        [self turnOn];
        [self.selectionDelegate addLetterToShelf:self.characterView.text];
    }else{
        [self turnOff];
        [self.selectionDelegate removeLetterFromShelf:self.characterView.text];
    }
}

- (void) turnOn{
    self.selected = YES;
    UIColor *alumminum = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]; //Gray color to indicate that tile is "used"
    
    [UIView animateWithDuration:0.15 animations:^{self.backgroundColor = alumminum;}]; //Animate
}

- (void) turnOff{
    self.selected = NO;
    UIColor *peach = [UIColor colorWithRed:1.0 green:0.8 blue:0.4 alpha:1.0];//peach color to indicate that tile is "unused"
    
    [UIView animateWithDuration:0.15 animations:^{self.backgroundColor = peach;}]; //Animate
}

- (void) setLetter:(NSString *)letter{
    _letter = letter;
    self.characterView.text = letter;
}
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
