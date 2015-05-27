//
//  NextRegistController.m
//  myHttpClient
//
//  Created by denglong on 5/21/15.
//  Copyright (c) 2015 邓龙. All rights reserved.
//

#define HTTPURL @"http://192.168.10.204/myTest/enterReg.php"

#import "NextRegistController.h"
#import "ResponseController.h"
#import "ViewController.h"

@interface NextRegistController ()<ToolDelegate>
{
    ResponseController *client;
}

@end

@implementation NextRegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [ResponseController sharedManager];
    client.delegate = self;
    _enterBtn.layer.cornerRadius = 8;
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)enterAction:(id)sender {
    NSDictionary *dic = @{@"username":_userName, @"password":_passWord.text};
    [client mothRequestPostUrl:HTTPURL andDic:dic];
}

-(void)responseDicSussecd:(NSDictionary *)response {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"完成" otherButtonTitles: nil];
    [alert show];
}

-(void)responseDicFiled:(NSDictionary *)response {
    NSString *message = [response objectForKey:@"message"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
}

@end
