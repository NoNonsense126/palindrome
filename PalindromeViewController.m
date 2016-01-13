//
//  PalindromeViewController.m
//  palindrome
//
//  Created by Wong You Jing on 13/01/2016.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "PalindromeViewController.h"

@interface PalindromeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation PalindromeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)checkPalindrome:(id)sender {
    NSString *palindrome = self.textField.text;
    NSString *escapedString = [[[palindrome componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""] lowercaseString];
    NSUInteger length = escapedString.length;
    
    NSLog(@"length = %lu", length);
    
    for (int i = 0; i < length/2; i++) {
        NSLog(@"[palindrome characterAtIndex: %i] = %c", i, [palindrome characterAtIndex:i]);
        char frontChar = [escapedString characterAtIndex:i];
        char backChar = [escapedString characterAtIndex:(length - 1 - i)];
        if(frontChar != backChar){
            self.resultLabel.text = @"Not Palindrome!";
            return;
        }
    }
    
    self.resultLabel.text = @"Palindrome!";
}

- (IBAction)makePalindrome:(id)sender {
    NSString *textInput = self.textField.text;
    NSMutableString *palindrome = [textInput mutableCopy];
    NSUInteger length = textInput.length;
    
    for(int i = 0; i < length; i++){
        [palindrome appendString:[NSString stringWithFormat:@"%c", [textInput characterAtIndex:(length - i - 1)]]];
    }
    
    self.resultLabel.text = [NSString stringWithFormat:@"%@", palindrome];
}

@end
