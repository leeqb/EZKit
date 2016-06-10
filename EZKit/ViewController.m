//
//  ViewController.m
//  EZKit
//
//  Created by leeqb on 4/26/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "ViewController.h"
#import "PopWindowTestViewController1.h"
#import "SearchBarTestViewController1.h"

#define LOAD_CONTROLLER(nib, vc)    [[UIStoryboard storyboardWithName:nib bundle:nil]instantiateViewControllerWithIdentifier:vc];

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_menuArray;
}

@property (weak, nonatomic) IBOutlet UITableView *menuTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NetworkTest1 *nt1 = [NetworkTest1 new];
//    [nt1 startRequest];
//    
//    [EZAlertView.sharedInstance show:@"sss"];
    
    NSDate *currentDate = [NSDate date];
    currentDate = [currentDate zeroDate];
    //NSLog(@"%@", [currentDate stringWithFormat:kEZDateFormat_FULL]);
    //NSLog(@"%@", [NSDate timeStringWithSeconds:20 formatString:kEZDateFormat_TIME]);
    
    _menuArray = @[@"弹出框", @"搜索框"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.textLabel.text = _menuArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
        {
            PopWindowTestViewController1 *vc = LOAD_CONTROLLER(@"WindowTest", @"PopWindowTestViewController1");
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            SearchBarTestViewController1 *vc = LOAD_CONTROLLER(@"SearchBar", @"SearchBarTestViewController1");
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
