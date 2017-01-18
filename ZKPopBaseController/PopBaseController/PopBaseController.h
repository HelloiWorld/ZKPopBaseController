//
//  PopBaseController.h
//  Football_talk_iphone
//
//  Created by Aone on 16/6/7.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopBaseController : UIViewController <UINavigationControllerDelegate>

@property (nonatomic, strong) UIView *backView; //背景图

//导航栏
@property (nonatomic, strong) UIButton *leftBar; //左按钮(返回按钮)
@property (nonatomic, strong) UIButton *rightBar; //右按钮(关闭按钮)
@property (nonatomic, strong) UILabel *titleLabel; //标题
@property (nonatomic, strong) UIImageView *titleImage; //标题图片

@property (nonatomic, assign) BOOL isPresentCustomAnimation;   // 是否展示自定义动画

- (void)pushVC:(UIViewController *)viewController; //弹出界面
- (void)back; //返回上一页
- (void)closeVC; //关闭视图

@end
