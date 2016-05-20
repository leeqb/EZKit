//
//  EZAlertView.m
//  EZKit
//
//  Created by leeqb on 5/15/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZAlertView.h"

@implementation EZAlertView

+ (instancetype)sharedInstance
{
    static EZAlertView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [EZAlertView new];
    });
    return instance;
}

- (void)show:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
