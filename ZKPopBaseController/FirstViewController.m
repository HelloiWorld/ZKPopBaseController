//
//  FirstViewController.m
//  PopBaseController
//
//  Created by pzk on 16/7/1.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = @"First View";
    [self.leftBar removeFromSuperview];
    
    UIView *first = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.backView.frame.size.width, self.backView.frame.size.height)];
    [self.backView addSubview:first];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(120, 120, 200, 30);
    label.textColor = [UIColor blackColor];
    label.text = @"这是第一个界面";
    [label sizeToFit];
    [first addSubview:label];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    pushBtn.frame = CGRectMake(120, 200, 100, 30);
    [pushBtn setTitle:@"Push SecondVC" forState:UIControlStateNormal];
    [pushBtn sizeToFit];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [first addSubview:pushBtn];
}

- (void)push {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self pushVC:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
