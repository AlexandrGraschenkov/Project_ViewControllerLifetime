//
//  ViewController.m
//  TestViewController2
//
//  Created by Alexander on 13.11.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "TestSingleton.h"


@interface ViewController ()
{
}
@property (nonatomic, weak) IBOutlet UIButton *butt;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@end

@implementation ViewController


- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.butt setBackgroundImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.textField.text = [TestSingleton sharedInstance].someString;
    
    static NSInteger count = 1;
    NSLog(@"[%@ %@](%d)- %ld", NSStringFromClass(self.class), NSStringFromSelector(_cmd), __LINE__, (long)count);
    count++;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [TestSingleton sharedInstance].someString = self.textField.text;
}

- (IBAction)backPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
