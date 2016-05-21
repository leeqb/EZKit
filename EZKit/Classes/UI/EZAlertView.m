//
//  EZAlertView.m
//  EZKit
//
//  Created by leeqb on 5/15/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZAlertView.h"

typedef void(^ButtonClickedBlock)(NSInteger buttonIndex);

@implementation EZAlertView
{
    __strong ButtonClickedBlock _buttonClicked;
}

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

- (void)confirm:(NSString *)message buttonClicked:(ButtonClickedBlock)buttonClicked
{
    _buttonClicked = buttonClicked;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    _buttonClicked(buttonIndex);
}

@end
