//
//  UIImage+LSGif.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/9/5.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LSGif)

/** 用一个Gif生成UIImage，传入一个GIFData */
+ (UIImage *)ls_animatedImageWithAnimatedGIFData:(NSData *)theData;

/** 用一个Gif生成UIImage，传入一个GIF路径 */
+ (UIImage *)ls_animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

@end
