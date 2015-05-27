//
//  RegistViewController.m
//  myHttpClient
//
//  Created by denglong on 5/21/15.
//  Copyright (c) 2015 邓龙. All rights reserved.
//

#define HTTPURL @"http://192.168.10.204/myTest/register.php"

#import "RegistViewController.h"
#import "ResponseController.h"
#import "NextRegistController.h"

@interface RegistViewController ()<ToolDelegate>
{
    ResponseController *client;
}

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [ResponseController sharedManager];
    client.delegate = self;
    _nextBtn.layer.cornerRadius = 8;
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextAction:(id)sender {
    
    NSDictionary *dic = @{@"username":_userName.text};
    [client mothRequestPostUrl:HTTPURL andDic:dic];
}

- (void)responseDicSussecd:(NSDictionary *)response {
    NSLog(@"%@", response);
    NextRegistController *nextView = [[NextRegistController alloc] init];
    nextView.userName = _userName.text;
    [self presentViewController:nextView animated:YES completion:nil];
}

- (void)responseDicFiled:(NSDictionary *)response {
    NSLog(@"%@", response);
    NSString *message = [response objectForKey:@"message"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
}

@end
