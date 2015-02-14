//
//  HelpViewController.m
//  Shuffle
//
//  Created by Andrew Ke on 6/8/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "HelpViewController.h"
#import "UIOutlinedButton.h"
@interface HelpViewController ()
@property (weak, nonatomic) IBOutlet UIOutlinedButton *backButton;
@end

@implementation HelpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.backButton setTarget:self withSelector:@selector(backButtonPressed)];
}

- (void) backButtonPressed{
    [self performSegueWithIdentifier:@"goToHome" sender:self];
}

@end
