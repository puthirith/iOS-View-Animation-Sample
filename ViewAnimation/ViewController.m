//
//  ViewController.m
//  ViewAnimation
//
//  Created by Nuon Puthirith on 15/03/2017.
//  Copyright © 2017 NPGuru. All rights reserved.
//

#import "ViewController.h"

#define FROM_ABOVE 0
#define FROM_LEFT 1
#define FROM_RIGHT 2
#define FROM_BOTTOM 3

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action

- (IBAction)btnFromAbovePress:(id)sender
{
    [self moveViewFrom:FROM_ABOVE forButton:_btnFromAbove];
}

- (IBAction)btnFromLeftPress:(id)sender
{
    [self moveViewFrom:FROM_LEFT forButton:_btnFromLeft];
}

- (IBAction)btnFromRightPress:(id)sender
{
    [self moveViewFrom:FROM_RIGHT forButton:_btnFromRight];
}

- (IBAction)btnFromBottomPress:(id)sender
{
    [self moveViewFrom:FROM_BOTTOM forButton:_btnFromBottom];
}

#pragma mark - Custom method

- (void)moveViewFrom:(int)direction forButton:(UIButton*)button
{
    // Copy original frame
    CGRect originalFrame = button.frame;
    
    // Create modified frame
    CGRect rect = originalFrame;
    
    // set the start point of animation
    switch (direction) {
        case FROM_ABOVE:
            // Set Y of button to move from Top of the screen
            rect.origin.y = -45;
            break;
            
        case FROM_LEFT:
            // Set X of button to move from Left of the screen
            rect.origin.x = -110;
            break;
            
        case FROM_RIGHT:
            // Set Y of button to move from Right of the screen
            rect.origin.x = [UIScreen mainScreen].bounds.size.width;
            break;
            
        case FROM_BOTTOM:
            // Set Y of button to move from bottom of the screen
            rect.origin.y = [UIScreen mainScreen].bounds.size.height;
            
            break;
            
        default:
            break;
    }
    // Apply the start point of animation
    button.frame = rect;
    [UIView beginAnimations:button.titleLabel.text context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    // Apply the end point of animation
    button.frame = originalFrame;
    [UIView commitAnimations];
}

@end
