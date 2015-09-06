//
//  ViewController.m
//  MidTerm
//
//  Created by User1 on 2015-07-07.
//  Copyright (c) 2015 group3. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(![defaults boolForKey:@"registered"])
    {
        _loginBtn.hidden = YES;
    }
    else
    {
        _reEnterPassword.hidden = YES;
        _registerBtn.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if([_username.text isEqualToString:[defaults objectForKey:@"username"]] && [_password.text isEqualToString:[defaults objectForKey:@"password"]])
    {
        NSLog(@"LOGIN SUCCESSFUL");
        _username.text = nil;
        _password.text = nil;
        SecondViewController *vc = (SecondViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
        [self presentViewController:vc animated:YES completion:^{}];
        
    }
    else{
        NSLog(@"Login unsuccessful");
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Wrong Credentials" message:@"Username or Password incorrect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}

- (IBAction)registerButton:(UIButton *)sender {
    if([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""] || [_reEnterPassword.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Complete all fields" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
    else
    {
        [self checkPasswordMatch];
    }
}
-(void) checkPasswordMatch{
    if([_password.text isEqualToString:_reEnterPassword.text])
    {
        NSLog(@"Password Match");
        [self registerNewUser];
    }
    else{
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooppss" message:@"Your entered Passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    
}

-(void) registerNewUser{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_username.text forKey:@"username"];
    [defaults setObject:_password.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [success show];
    
    SecondViewController *vc = (SecondViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [self presentViewController:vc animated:YES completion:^{}];
    
    
}



@end
