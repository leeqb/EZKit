//
//  PopWindowTestViewController1.m
//  EZKit
//
//  Created by leeqb on 6/5/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "PopWindowTestViewController1.h"
#import "EZPopWindow.h"

@interface PopWindowTestViewController1 ()

@end

@implementation PopWindowTestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        EZPopWindow *popWindow = [[EZPopWindow alloc] initWithView:[UIView new]];
        [popWindow show];
    });
}

@end
