//
//  ResponseController.h
//  HttpClientDemo
//
//  Created by 邓龙 on 15/5/15.
//  Copyright (c) 2015年 www.beequick.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolDelegate

- (void)responseDicSussecd:(NSDictionary *)response;
- (void)responseDicFiled:(NSDictionary *)response;

@end

@interface ResponseController : UIViewController

@property (nonatomic, retain) id<ToolDelegate>delegate;

+ (ResponseController *)sharedManager;
- (void)getResponseList:(NSDictionary *)dict;
- (void)mothRequestUrl:(NSString *)url;
- (void)mothRequestPostUrl:(NSString *)url andDic:(NSDictionary *)dic;

@end
