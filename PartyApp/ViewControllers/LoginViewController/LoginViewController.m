//
//  LoginViewController.m
//  PartyApp
//
//  Created by Varun on 14/06/2014.
//  Copyright (c) 2014 WebFactory. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:true animated:true];
    [self setTitle:@"Login"];
    
    [self initDefaults];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init Defaults

- (void)initDefaults {
    
    NSString *forgotPasswordText = @"Forgot Password: Click HERE";
    NSMutableAttributedString *attrTextForgotLabel = [[NSMutableAttributedString alloc] initWithString:forgotPasswordText];
    
    NSDictionary *dictAttrText = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIColor yellowColor], NSForegroundColorAttributeName,
                                  @"forgotpassword", NSLinkAttributeName,
                                  [NSNumber numberWithInt:NSUnderlineStyleSingle], NSUnderlineStyleAttributeName, nil];
    NSRange rangeClickHere = [forgotPasswordText rangeOfString:@"Click HERE"];
    [attrTextForgotLabel addAttributes:dictAttrText range:rangeClickHere];
    
    [txtViewForgotPassword setAttributedText:attrTextForgotLabel];
}

#pragma mark - TextView Delegates

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    BOOL interact = true;
    if ([URL.absoluteString isEqualToString:@"forgotpassword"]) {
        NSLog(@"Forgot Password");
        interact = false;
    }
    return interact;
}

#pragma mark - Other Methods

- (void)resignKeyboard {
    for (UITextField *txtField in self.view.subviews)
        [txtField resignFirstResponder];
}

#pragma mark - IBActions

- (IBAction)btnCreateAccountAction:(id)sender {
}

- (IBAction)btnSignInAction:(id)sender {
}

- (IBAction)btnConnectFacebookAction:(id)sender {
}

#pragma mark - Touch Methods

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *touchedView = [[touches anyObject] view];
    if (![touchedView isKindOfClass:[UITextField class]])
        [self resignKeyboard];
}

@end
