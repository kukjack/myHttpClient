//
//  NextRegistController.h
//  myHttpClient
//
//  Created by denglong on 5/21/15.
//  Copyright (c) 2015 邓龙. All rights reserved.
//

#import "baseViewController.h"

@interface NextRegistController : baseViewController
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *enterBtn;
@property (nonatomic, retain) NSString *userName;

@end
