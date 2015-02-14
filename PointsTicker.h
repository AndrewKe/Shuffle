//
//  PointsTicker.h
//  Shuffle
//
//  Created by Andrew Ke on 5/23/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIBox.h"

@interface PointsTicker : UIBox
@property (strong,nonatomic) IBOutlet UILabel* pointsLabel;
- (void) addPoints: (int) points;
- (void) subtractPoints: (int) points;
- (void) resetToZero;
@end
