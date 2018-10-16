//
//  UIImage+LSMegre.h
//  LSaleClothingForIpad
//
//  Created by 陶冬波 on 2018/7/16.
//  Copyright © 2018年 Salewell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LSMegre)

/**
 图片合成

 @param imageArr 图片数组
 @param Inset 合成的图片上下左右边距
 @param lineSpace 图片之间的编剧
 @return 合成后的图片
 */
+ (UIImage*)ls_megreImageWithArry:(NSArray<UIImage*>*)imageArr andWithEdgeInset:(UIEdgeInsets)Inset andlineSpace:(CGFloat)lineSpace;


/**
 将2张图片合成一张图片

 @param firstImage 第一张
 @param secondImage 第二张
 @return 合成后的图片
 */
+ (UIImage*)ls_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
@end
