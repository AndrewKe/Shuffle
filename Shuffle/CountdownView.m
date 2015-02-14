//
//  CountdownView.m
//  Shuffle
//
//  Created by Andrew Ke on 5/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "CountdownView.h"
#import <math.h>

@interface  CountdownView()
@property (weak,nonatomic) IBOutlet UILabel *timerLabel; //Label displaying seconds remaining
@property (nonatomic) int secondsLeft;
@property (strong, nonatomic) NSTimer *countdownTimer;
@property (nonatomic) SEL zeroSelector; //Called when timer is at 0
@property (strong, nonatomic) UIViewController* targetViewController; //zeroSelctor will be called on it
@end


@implementation CountdownView

- (void) awakeFromNib{ //Early UIViewLifeCycle
    [super awakeFromNib];
    self.secondsLeft = 60;
    self.countdownTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(countdownTimerFireMethod:)
                                                userInfo:nil repeats:YES];//Create a timer and add it to the run loop
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop addTimer:self.countdownTimer forMode:NSDefaultRunLoopMode];
}

- (void) countdownTimerFireMethod: (NSTimer *)t{ //Decrease second count
    if(self.secondsLeft>0){
        self.secondsLeft--;
    }else{
        self.backgroundColor = [UIColor redColor];
        [self.targetViewController performSelector:self.zeroSelector];
        self.targetViewController = nil;
        return;
    }
    int minutes = self.secondsLeft/60;
    int seconds = self.secondsLeft%60;
    if(seconds<10){ //Make sure theres that extra zero (1:08 not 1:8)
        self.timerLabel.text = [NSString stringWithFormat:@"%d:0%d",minutes,seconds];
    }else{
        self.timerLabel.text = [NSString stringWithFormat:@"%d:%d",minutes,seconds];
    }
}

- (void) addTime: (int) seconds{
    self.secondsLeft = self.secondsLeft+seconds;
}

- (void) setTarget:(UIViewController *)vc withSelector:(SEL)selector{
    self.targetViewController = vc;
    self.zeroSelector = selector;
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
