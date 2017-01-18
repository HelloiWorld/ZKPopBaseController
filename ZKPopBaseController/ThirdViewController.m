//
//  ThirdViewController.m
//  ZKPopBaseController
//
//  Created by pzk on 17/1/18.
//  Copyright © 2017年 Aone. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = @"Third View";
    self.backView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(120, 200, 200, 30);
    label.textColor = [UIColor redColor];
    label.text = @"这是第三个界面";
    [label sizeToFit];
    [self.backView addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
