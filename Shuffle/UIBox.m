//
//  UIBox.m
//  Conway's Game Of Life
//
//  Created by Andrew Ke on 4/17/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIBox.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void) awakeFromNib{
    [self setUp];
    [super awakeFromNib];
}

- (void) setUp{
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = NO;
    //self.layer.shadowOffset = CGSizeMake(-4, 4);
    //self.layer.shadowRadius = 4;
    //self.layer.shadowOpacity = 0.5;
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
