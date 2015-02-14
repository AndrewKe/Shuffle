//
//  GameOverViewController.m
//  Shuffle
//
//  Created by Andrew Ke on 6/1/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "GameOverViewController.h"
#import "UIRoundRectButton.h"
#import <AVFoundation/AVFoundation.h>

@interface GameOverViewController ()
@property (weak, nonatomic) IBOutlet UIRoundRectButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UIRoundRectButton *homeButton;
@property (strong,nonatomic) AVAudioPlayer *awwPlayer;
@property (strong,nonatomic) NSTimer *timer; //Timer used to generate flying letters

@end

@implementation GameOverViewController

- (void)viewDidLoad{
    self.timer  = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(launchLetter:) userInfo:nil repeats:YES];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"aww"
                                         ofType:@"mp3"]];
    self.awwPlayer = [[AVAudioPlayer alloc]
                      initWithContentsOfURL:url
                      error:nil];
    [self.awwPlayer play];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.playAgainButton setTarget:self withSelector:@selector(playAgainTapped)];
    [self.homeButton setTarget:self withSelector:@selector(homeTapped)];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) playAgainTapped{
    [self performSegueWithIdentifier:@"goToGame" sender:self];
}

- (void) homeTapped{
    [self performSegueWithIdentifier:@"goToHome" sender:self];
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

@end
