//
//  WordMachine.m
//  Shuffle
//
//  Created by Andrew Ke on 5/21/14.
//  Copyright (c) 2014 Andrew Ke. All rights reserved.
//

#import "WordMachine.h"
#import "NSMutableArray+Shuffling.h"

@interface WordMachine()
@property (strong,nonatomic) NSArray* sixLetterWords; //All six letter words in the english dictioanry
@property (strong,nonatomic) NSArray* allWords; //All the words in the english dictionary
@end
@implementation WordMachine

- (instancetype) init{
    NSLog(@"Word Machine Initialization sequence has begun!");
    
    //Select random word from 6-letter-words.txt
    NSLog(@"Selecting 6 letter word...");
    NSString *sixfilepath = [[NSBundle mainBundle] pathForResource:@"6-letter-words" ofType:@"txt"]; //File reading stuff
    NSError *error;
    NSString *sixfileContents = [NSString stringWithContentsOfFile:sixfilepath encoding:NSUTF8StringEncoding error:&error];
    NSArray *listArray = [sixfileContents componentsSeparatedByString:@"\n"]; //Break the file up using the newlines
    self.sixLetterWords = listArray;
    
    NSString *wordfilepath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];//Open file
    NSString *wordfileContents = [NSString stringWithContentsOfFile:wordfilepath encoding:NSUTF8StringEncoding error:&error];
    NSArray *wordlistArray = [wordfileContents componentsSeparatedByString:@"\n"]; //Break the file up using the newlines
    self.allWords = wordlistArray;
    [self createNewWordSet];
    return self;
}

- (void)createNewWordSet{
    int randomIndex = arc4random_uniform([self.sixLetterWords count]); //Take a random word...
    NSString *baseWord = self.sixLetterWords[randomIndex];
    
    NSMutableArray *splitString = [[NSMutableArray alloc] init]; //Split the string in to individaul characters
    for(int i=0; i<[baseWord length];i++){
        [splitString addObject:[baseWord substringWithRange:NSMakeRange(i, 1)]];
    }
    [splitString shuffle];
    self.baseLetters = [NSArray arrayWithArray:splitString];
    
    NSMutableArray *wordCombo = [[NSMutableArray alloc] init];
    for(int i=1; i<=6; i++){
        [wordCombo addObjectsFromArray:[self pick:i from:splitString]];
    }
    NSLog(@"Stage 1 Complete");

    NSMutableArray *finalWords = [[NSMutableArray alloc] init];
    NSSet *wordsSet = [NSSet setWithArray:self.allWords];
    for(NSString* candidate in wordCombo){
        if([wordsSet member:candidate]){
            if(![finalWords containsObject:candidate]){
                [finalWords addObject:candidate];
            }
        }
    }
    NSLog(@"Filtered Words: %@",finalWords);
    self.words = [NSArray arrayWithArray:finalWords];
}

- (NSMutableArray *)pick:(int)count from:(NSArray *)letters{
    NSMutableArray *returnWords = [[NSMutableArray alloc] init];
    NSAssert(count!=0, @"Count is zero");
    if(count == 1){
        for(NSString *letter in letters){
            [returnWords addObject:letter];
        }
    }else{
        for(NSString *letter in letters){
            NSMutableArray *nextStepLetters = [NSMutableArray arrayWithArray:letters];
            
            [nextStepLetters removeObjectAtIndex:[nextStepLetters indexOfObject:letter]];
            NSMutableArray *suffixes = [self pick:count-1 from:[NSArray arrayWithArray:nextStepLetters]];
            //NSLog(@"Suffixes are %@",suffixes.description);
            for(NSString* suffix in suffixes){
                [returnWords addObject:[letter stringByAppendingString:suffix]];
            }
        }
    }
    return returnWords;
}

- (void) removeWord: (NSString *)word{ //Remove word from the words array so it can't be scored again
    NSMutableArray *mut = [self.words mutableCopy];
    [mut removeObject:word];
    self.words = [mut copy];
}
@end
