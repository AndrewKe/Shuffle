//
//  CountdownView.h
//  Shuffle
//
//  Created by Andrew Ke on 5/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "UIBox.h"

@interface CountdownView : UIBox
- (void) addTime: (int)seconds;
- (void) setTarget: (UIViewController *)vc withSelector: (SEL) selector;//Selector called when ticker goes to zero.
@end
