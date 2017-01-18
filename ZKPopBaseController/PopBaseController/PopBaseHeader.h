//
//  PopBaseHeader.h
//  ZKPopBaseController
//
//  Created by pzk on 17/1/18.
//  Copyright © 2017年 Aone. All rights reserved.
//

#ifndef PopBaseHeader_h
#define PopBaseHeader_h

#define ImageSrcName(file) [@"PopBase.bundle" stringByAppendingPathComponent:file]
// 屏幕的宽、高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenScale  [UIScreen mainScreen].bounds.size.width/320.0

/**
 弹窗类型
 */
typedef NS_ENUM(NSUInteger, PopType) {
    PopType_A,  // 对应PopWindowTypeA
    PopType_B,  // 对应PopWindowTypeB
    PopType_C,  // 对应PopWindowTypeC
};
// 3种尺寸弹窗
#define PopWindowTypeA CGRectMake((kScreenWidth-320*kScreenScale)/2+8*kScreenScale, (kScreenHeight-460*kScreenScale)/2, 320*kScreenScale-16*kScreenScale, 460*kScreenScale)
#define PopWindowTypeB CGRectMake((kScreenWidth-280*kScreenScale)/2+8*kScreenScale, (kScreenHeight-428*kScreenScale)/2, 280*kScreenScale-16*kScreenScale, 428*kScreenScale)
#define PopWindowTypeC CGRectMake((kScreenWidth-280*kScreenScale)/2+8*kScreenScale, (kScreenHeight-303*kScreenScale)/2, 280*kScreenScale-16*kScreenScale, 303*kScreenScale)

// 移除遮罩blackView
#define NSNotificationRemoveBlackView @"NSNotificationRemoveBlackView"

#endif /* PopBaseHeader_h */
