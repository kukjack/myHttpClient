//
//  ResponseController.m
//  HttpClientDemo
//
//  Created by 邓龙 on 15/5/15.
//  Copyright (c) 2015年 www.beequick.cn. All rights reserved.
//

#import "ResponseController.h"
#import "myHttpClient-swift.h"

@interface ResponseController ()

@end

@implementation ResponseController

+ (ResponseController *)sharedManager {
    
    static ResponseController *sharedMyManager = nil;
    
    @synchronized(self) {
        if (sharedMyManager == nil)
            
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 * Method name: <#方法名#>
 * Description: <#方法描述#>
 * Parameter: <#参数1#>
 * Parameter: <#参数2#>
 */
//Get请求
- (void)mothRequestUrl:(NSString *)url {
    RequestController *request = [[RequestController alloc] init];
    [request requestGetData:url];
}

//不带NSDATA的post请求
- (void)mothRequestPostUrl:(NSString *)url andDic:(NSDictionary *)dic {
    RequestController *request = [[RequestController alloc] init];
    [request requestPostData:url dic:dic];
}

- (void)getResponseList:(NSDictionary *)dict {
    NSInteger code = [[dict objectForKey:@"code"] integerValue];
    if (code == 200) {
        [self.delegate responseDicSussecd:dict];
    }
    else
    {
       [self.delegate responseDicFiled:dict];
    }
}

@end
