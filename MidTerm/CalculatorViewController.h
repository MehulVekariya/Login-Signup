//
//  CalculatorViewController.h
//  MidTerm
//
//  Created by User1 on 2015-07-07.
//  Copyright (c) 2015 group3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;


@property (weak, nonatomic) IBOutlet UILabel *answer;

- (IBAction)add:(UIButton *)sender;
@end
