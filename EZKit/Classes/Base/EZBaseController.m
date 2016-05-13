//
//  EZBaseController.m
//  EZKit
//
//  Created by leeqb on 11/8/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "EZBaseController.h"

@implementation EZBaseController

+ (void)removeBackTitle:(UIViewController *)vc
{
    UIBarButtonItem *newBackItem = [UIBarButtonItem new];
    vc.navigationItem.backBarButtonItem = newBackItem;
    vc.navigationItem.backBarButtonItem.title = @"";
}

@end
