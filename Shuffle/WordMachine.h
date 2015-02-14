//
//  WordMachine.h
//  Shuffle
//
//  Created by Andrew Ke on 5/21/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordMachine : NSObject
@property (strong,nonatomic) NSArray* baseLetters;//Letters to be displayed on the screen
@property (strong,nonatomic) NSArray* words; //All the words able to be made from the displayed letters

- (void) removeWord: (NSString *) word; //Remove a word from words NSArray so it can't be used again
- (void) createNewWordSet; //Genrate words array again with a new six letter base word
@end
