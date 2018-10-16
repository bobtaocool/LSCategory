//
//  UIView+LSSnapshot.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
  截图.快照
 */
@interface UIView (LSSnapshot)

/**
 对当前的View截图,生成图片
 */
- (nullable UIImage *)snapshotImage;

/**
 对当前的View截图,生成图片,此方法更快，当可能使屏幕更新
 @param afterUpdates 是否更新屏幕
 */
- (nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

/**
 对当前view截图生成pdf
 @return NSData
 */
- (nullable NSData *)snapshotPDF;

@end
