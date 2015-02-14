//
//  UIOutlinedButton.m
//  Shuffle
//
//  Created by Andrew Ke on 6/7/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIOutlinedButton.h"

@implementation UIOutlinedButton

- (void) awakeFromNib{
    self.layer.borderWidth = 3.0f;
    self.layer.borderColor = self.backgroundColor.CGColor;
    self.backgroundColor = [UIColor clearColor];
    [super awakeFromNib];
}





@end
