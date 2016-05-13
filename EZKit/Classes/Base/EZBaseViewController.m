//
//  EZBaseViewController.m
//  EZKit
//
//  Created by leeqb on 11/8/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "EZBaseViewController.h"
#import "EZBaseController.h"

@interface EZBaseViewController ()

@end

@implementation EZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [EZBaseController removeBackTitle:self];
}

@end
