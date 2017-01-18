//
//  ViewController.m
//  ZKPopBaseController
//
//  Created by pzk on 17/1/18.
//  Copyright © 2017年 Aone. All rights reserved.
//

#import "ViewController.h"
#import "PopBottomView.h"
#import "FirstViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *blackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 注册通知移除遮罩view
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeBlackView) name:NSNotificationRemoveBlackView object:nil];
}

- (IBAction)popClick:(id)sender{
    [self.view addSubview:self.blackView];
    
    PopBottomView *pop = [[PopBottomView alloc] initWithType:PopType_A];
    [self.view addSubview:pop];
    
    FirstViewController *vc = [[FirstViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [pop addSubview:navi.view];
    [self addChildViewController:navi];
}

- (UIView*)blackView {
    if (!_blackView) {
        _blackView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0.8;
    }
    return _blackView;
}

- (void)removeBlackView{
    [self.blackView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
