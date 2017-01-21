//
//  PopBaseController.m
//  Football_talk_iphone
//
//  Created by Aone on 16/6/7.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "PopBaseController.h"
#import "PopBaseHeader.h"
#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"

@interface PopBaseController ()
@property (nonatomic, assign) NSNumber *width;  // 存储的宽度
@property (nonatomic, assign) NSNumber *height;  // 存储的高度

@end

@implementation PopBaseController

#pragma mark - 重新定义self.view的尺寸
- (void)loadView {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    _width = [user objectForKey:@"Width"];
    _height = [user objectForKey:@"Height"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width.floatValue, _height.floatValue+8*kScreenScale)];
    self.view = view;
}

- (void)viewWillLayoutSubviews {
    self.view.frame = CGRectMake(0, 0, _width.floatValue, _height.floatValue+8*kScreenScale);
}

#pragma mark - 导航栏的UI
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.hidden = YES;
    
    /* 灰色框内白色区域 */
    [self.view addSubview:self.backView];
    
    /* 标题 */
    [self.view addSubview:self.titleLabel];
    /* 标题图片 */
//    [self.view addSubview:self.titleImage];
    
    /* 返回按钮 */
    [self.view addSubview:self.leftBar];
    
    /* 关闭按钮 */
    [self.view addSubview:self.rightBar];
}

#pragma mark - 视图将要出现
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 代理必须放在此处,否则界面切换时 代理指针指向了最后一个界面
    self.navigationController.delegate = self;
    
    self.titleLabel.hidden = NO;
    self.titleImage.hidden = NO;
    self.leftBar.hidden = NO;
    self.rightBar.hidden = NO;
}

#pragma mark - 视图将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.titleLabel.hidden = YES;
    self.titleImage.hidden = YES;
    self.leftBar.hidden = YES;
    self.rightBar.hidden = YES;
}

#pragma mark- 懒加载控件
/* 灰色框内白色区域 */
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.frame = CGRectMake(0, 32*kScreenScale, self.view.frame.size.width, self.view.frame.size.height-32*kScreenScale-8*kScreenScale);
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 4;
        _backView.backgroundColor = [UIColor clearColor];
    }
    return _backView;
}

/* 标题 */
-(UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(self.view.frame.size.width/2-160/2, kScreenScale, 160, 30*kScreenScale);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titleLabel;
}

/* 标题图片 */
-(UIImageView*)titleImage{
    if (!_titleImage) {
        _titleImage = [[UIImageView alloc] init];
        _titleImage.frame = CGRectMake(self.view.frame.size.width/2-32*kScreenScale/2, 8*kScreenScale, 32*kScreenScale, 17*kScreenScale);
        _titleImage.contentMode = UIViewContentModeTop;
    }
    return _titleImage;
}

/* 返回按钮 */
-(UIButton*)leftBar{
    if (!_leftBar) {
        _leftBar = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBar setImage:[UIImage imageNamed:ImageSrcName(@"弹窗-按钮-返回")] forState:UIControlStateNormal];
        _leftBar.frame = CGRectMake(0, 7*kScreenScale, 25*kScreenScale, 20*kScreenScale);
        [_leftBar addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBar;
}

/* 关闭按钮 */
-(UIButton*)rightBar{
    if (!_rightBar) {
        _rightBar = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBar setImage:[UIImage imageNamed:ImageSrcName(@"弹窗-按钮-关闭")] forState:UIControlStateNormal];
        _rightBar.frame = CGRectMake(self.view.frame.size.width-24*kScreenScale, 5*kScreenScale, 24*kScreenScale, 24*kScreenScale);
        [_rightBar addTarget:self action:@selector(closeVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBar;
}

#pragma mark - 推出下一页
- (void)pushVC:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 返回上一页
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 关闭视图
- (void)closeVC {
    /* 关闭黑色透明背景层的通知 */
    [[NSNotificationCenter defaultCenter] postNotificationName:NSNotificationRemoveBlackView object:nil];
    
    /* 关闭视图的动画 */
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.navigationController.view.superview.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self.navigationController.view.superview removeFromSuperview];
    }];
}


#pragma mark - 重写视图过场动画的效果
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        //  push的时候是否用我们自己定义的customPush
        if (_isPresentCustomAnimation == YES) {
            return nil;
        } else {
            // 自定义Push效果
            CustomPushAnimation *customPush = [[CustomPushAnimation alloc] init];
            return customPush;
        }
    }else if (operation == UINavigationControllerOperationPop) {
        //  pop的时候是否用我们自己定义的customPop
        if (_isPresentCustomAnimation == YES) {
            return nil;
        } else {
            // 自定义Pop效果
            CustomPopAnimation *customPop = [[CustomPopAnimation alloc] init];
            return customPop;
        }
    } else {
        return nil;
    }
}

@end
