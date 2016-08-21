//
//  ButtonTestViewController.m
//  EZKit
//
//  Created by leeqb on 8/21/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "ButtonTestViewController.h"

@interface ButtonTestViewController ()<EZCountDownButtonDelegate>
@property (weak, nonatomic) IBOutlet EZCountDownButton *countButton;

@end

@implementation ButtonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _countButton.delegate = self;
    _countButton.disabledBackgroundColor = [UIColor clearColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_countButton startCountDown:5];
    });
}

- (NSAttributedString *)attributedTextForDisabledState:(NSInteger)leftSeconds
{
    NSString *str = [NSString stringWithFormat:@"%ld秒后再次发送验证码", (long)leftSeconds];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString: str];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    
    return attrString;
}

@end
