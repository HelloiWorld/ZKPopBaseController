//
//  PopBottomView.h
//  Football_talk_iphone
//
//  Created by Aone on 16/6/20.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopBaseHeader.h"

@interface PopBottomView : UIView

- (instancetype)initWithType:(PopType)popType;

@property (nonatomic, strong) UIImageView *imageV;  // 底图展示图片

@end
