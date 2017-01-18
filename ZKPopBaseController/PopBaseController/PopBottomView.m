//
//  PopBottomView.m
//  Football_talk_iphone
//
//  Created by Aone on 16/6/20.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "PopBottomView.h"
#import "PopBaseHeader.h"

@implementation PopBottomView

- (instancetype)initWithType:(PopType)popType {
    if (popType == PopType_A) {
        self = [super initWithFrame:PopWindowTypeA];
    } else if (popType == PopType_B) {
        self = [super initWithFrame:PopWindowTypeB];
    } else if (popType == PopType_C) {
        self = [super initWithFrame:PopWindowTypeC];
    }
    if (self) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:[NSNumber numberWithFloat:self.frame.size.height-8*kScreenScale] forKey:@"Height"];
        [user setObject:[NSNumber numberWithFloat:self.frame.size.width] forKey:@"Width"];
        
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(-8*kScreenScale, 0, self.frame.size.width+16*kScreenScale, self.frame.size.height)];
        UIImageView *insideImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 32*kScreenScale, self.frame.size.width, self.frame.size.height-32*kScreenScale-8*kScreenScale)];
        
        switch (popType) {
            case PopType_A:
                _imageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗1-底图")];
                insideImageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗1-内部")];
                break;
            case PopType_B:
                _imageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗2-底图")];
                insideImageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗2-内部")];
                break;
            case PopType_C:
                _imageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗5-底图")];
                insideImageV.image = [UIImage imageNamed:ImageSrcName(@"弹窗5-内部")];
                break;
            default:
                break;
        }
        [self addSubview:_imageV];
        [self addSubview:insideImageV];
        
        self.transform = CGAffineTransformMakeScale(0.7, 0.7);
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:15 options:UIViewAnimationOptionCurveLinear animations:^{
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:nil];
    }
    return self;
}



@end
