//
//  UIRoundRectButton.m
//  Shuffle
//
//  Created by Andrew Ke on 5/31/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIRoundRectButton.h"
@interface UIRoundRectButton()
@property (strong,nonatomic) NSObject *target;
@property (nonatomic) SEL selector;
@end

@implementation UIRoundRectButton

- (void) awakeFromNib{
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
}

- (void) setTarget:(NSObject *)target withSelector:(SEL)selector{
    self.target = target;
    self.selector = selector;
}

- (void) tapped: (UITapGestureRecognizer *) recognizer{
    /*[UIView animateWithDuration:0.15 animations:^{self.alpha = 0.5;} completion:^(BOOL completed){
        [UIView animateWithDuration:0.15 animations:^{self.alpha = 1;}];
    }]; */ //Animate "FLASH" effect
    [self.target performSelector:self.selector];//Perform the selector supplied on the ShuffleViewController
    
}

@end
