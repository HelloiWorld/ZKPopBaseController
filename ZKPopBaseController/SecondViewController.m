//
//  SecondViewController.m
//  PopBaseController
//
//  Created by pzk on 16/7/1.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = @"Second View";
    [self.view addSubview:self.leftBar];
    
    UIView *second = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.backView.frame.size.width, self.backView.frame.size.height)];
    [self.backView addSubview:second];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(120, 120, 200, 30);
    label.textColor = [UIColor blackColor];
    label.text = @"这是第二个界面";
    [label sizeToFit];
    [second addSubview:label];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    pushBtn.frame = CGRectMake(120, 200, 100, 30);
    [pushBtn setTitle:@"Push ThirdVC" forState:UIControlStateNormal];
    [pushBtn sizeToFit];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [second addSubview:pushBtn];
}

- (void)push {
    ThirdViewController *vc = [[ThirdViewController alloc] init];
    [self pushVC:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
