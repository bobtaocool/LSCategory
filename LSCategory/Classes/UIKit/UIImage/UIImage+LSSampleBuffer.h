//
//  UIImage+sampleBuffer.h
//  mtcnnFaceLiving
//
//  Created by 陶冬波 on 2018/8/28.
//  Copyright © 2018年 陶冬波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
@interface UIImage (LSSampleBuffer)
//根据输出的内容生成图片，人脸检测时使用
+ (UIImage *)imageFromSampleBuffer:(CMSampleBufferRef)sampleBuffer;

@end
