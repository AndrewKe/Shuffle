//
//  HomeViewController.m
//  Shuffle
//
//  Created by Andrew Ke on 6/1/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "HomeViewController.h"
#import "UIRoundRectButton.h"
#import "UIOutlinedButton.h"
#import <AudioToolbox/AudioServices.h>
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIRoundRectButton *playButton;
@property (weak, nonatomic) IBOutlet UIOutlinedButton *helpButton;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong,nonatomic) NSTimer *timer; //Timer used to generate flying letters
@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.playButton setTarget:self withSelector:@selector(playButtonPressed)];
    
    //NSError *error;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"theme"
                                         ofType:@"mp3"]];
    NSLog(@"%@",url.description);
    self.player = [[AVAudioPlayer alloc]
                                  initWithContentsOfURL:url
                                  error:nil];
    NSLog(@"Player: %@" , self.player);
    self.player.numberOfLoops = -1;
    [self.player play];
    
    self.timer  = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(launchLetter:) userInfo:nil repeats:YES];
    
    [self.helpButton setTarget:self withSelector:@selector(helpButtonPressed)];
}
- (IBAction)screenTapped:(UITapGestureRecognizer *) tap{
    UILabel *letter = [[UILabel alloc] init];
    [letter setFrame:CGRectMake([tap locationInView:self.view].x, [tap locationInView:self.view].y, 50, 50)];
    //letter.backgroundColor = [UIColor redColor];
    NSString *randomLetter = [@"ABCDEFGHIJKLNOPQRSTUVWXYZ" substringWithRange:NSMakeRange(arc4random_uniform(25), 1)];
    [letter setText:randomLetter];
    letter.alpha = 0.1;
    letter.textAlignment = NSTextAlignmentCenter;
    letter.textColor = [UIColor grayColor];
    letter.font = [UIFont fontWithName:@"DINAlternate-Bold" size:30.0];
    [self.view addSubview:letter];
    [UIView animateWithDuration:5.0 animations:^{
        [letter setFrame:CGRectMake(letter.frame.origin.x, -60, 50, 50)];
    }];
}

- (void)playButtonPressed{
    [self.player pause];
    NSLog(@"Segueing to Game");
    [self performSegueWithIdentifier:@"goToGame" sender:self];
    NSLog(@"Segue Complete");
}

- (void) launchLetter: (id) object{
    UILabel *letter = [[UILabel alloc] init];
    [letter setFrame:CGRectMake(arc4random_uniform(self.view.bounds.size.width)-50, self.view.bounds.size.height, 50, 50)];
    //letter.backgroundColor = [UIColor redColor];
    NSString *randomLetter = [@"ABCDEFGHIJKLNOPQRSTUVWXYZ" substringWithRange:NSMakeRange(arc4random_uniform(25), 1)];
    [letter setText:randomLetter];
    letter.alpha = 0.1;
    letter.textAlignment = NSTextAlignmentCenter;
    letter.textColor = [UIColor grayColor];
    letter.font = [UIFont fontWithName:@"DINAlternate-Bold" size:30.0];
    [self.view addSubview:letter];
    [UIView animateWithDuration:5.0 animations:^{
        [letter setFrame:CGRectMake(letter.frame.origin.x, -60, 50, 50)];
    }];
}

- (void) helpButtonPressed{
    [self.player pause];
    [self performSegueWithIdentifier:@"goToHelp" sender:self];
}



@end
