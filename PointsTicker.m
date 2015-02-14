//
//  PointsTicker.m
//  Shuffle
//
//  Created by Andrew Ke on 5/23/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "PointsTicker.h"

@interface PointsTicker()
@property (nonatomic) int points;
@end
@implementation PointsTicker

-(void) addPoints:(int)points{
    self.points = self.points+points;
    [self updateLabel];
    [self smokeUpPoints:points];
}

- (void) subtractPoints:(int)points{
    self.points = self.points-points;
    [self updateLabel];
}

- (void) resetToZero{
    self.points = 0;
    [self updateLabel];
}

- (void) updateLabel{
    self.pointsLabel.text = [NSString stringWithFormat:@"%@%d",[self.pointsLabel.text substringToIndex:1],self.points];
}

- (void) smokeUpPoints:(int) points{
    UILabel *smoke = [[UILabel alloc] initWithFrame:self.pointsLabel.frame];
    smoke.text = [NSString stringWithFormat:@"+%d",points];
    smoke.textColor = [UIColor colorWithRed:0 green:0.6 blue:0 alpha:1.0];
    [self addSubview:smoke];
    [UIView animateWithDuration:1.0 animations:^{
        smoke.center = CGPointMake(smoke.center.x, smoke.center.y-50);
        smoke.alpha = 0;
    }];
    
}


@end
