//
//  ViewController.h
//  MidTerm
//
//  Created by User1 on 2015-07-07.
//  Copyright (c) 2015 group3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPassword;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

- (IBAction)loginButton:(UIButton *)sender;
- (IBAction)registerButton:(UIButton *)sender;
@end
