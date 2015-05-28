//
//  ViewController.m
//  myHttpClient
//
//  Created by 邓龙 on 15/5/16.
//  Copyright (c) 2015年 邓龙. All rights reserved.
//

#define HTTPURL @"http://192.168.10.204/myTest/login.php"

#import "ViewController.h"
#import "ResponseController.h"
#import "RegistViewController.h"

@interface ViewController ()<ToolDelegate>
{
    ResponseController *client;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [ResponseController sharedManager];
    client.delegate = self;
    
    _loginBtn.layer.cornerRadius = 8;
}
- (IBAction)keyHiden:(id)sender {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}

- (IBAction)forgetPwAction:(id)sender {
}

- (IBAction)newUserAction:(id)sender {
    RegistViewController *registView = [[RegistViewController alloc] init];
    [self presentViewController:registView animated:YES completion:nil];
}


- (void)subment:(id)sender {
    
}

/**
 * Method name: loginAction
 * Description: 点击登录
 * Parameter: 无
 * Parameter: 无
 */
- (IBAction)loginAction:(id)sender {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    
    NSDictionary *dic = @{@"username":_username.text, @"password":_password.text};
    [client mothRequestPostUrl:HTTPURL andDic:dic];
}

- (void)responseDicSussecd:(NSDictionary *)response {
    NSLog(@"%@", response);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
}

- (void)responseDicFiled:(NSDictionary *)response {
    NSLog(@"%@", response);
    NSString *message = [response objectForKey:@"message"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
}

@end
