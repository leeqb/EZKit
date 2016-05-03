//
//  ViewController.m
//  EZKit
//
//  Created by leeqb on 4/26/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "ViewController.h"
#import "NetworkTest1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NetworkTest1 *nt1 = [NetworkTest1 new];
    [nt1 startRequest];
}

@end
