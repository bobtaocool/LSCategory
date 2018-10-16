//
//  UIImage+LSMegre.m
//  LSaleClothingForIpad
//
//  Created by 陶冬波 on 2018/7/16.
//  Copyright © 2018年 Salewell. All rights reserved.
//

#import "UIImage+LSMegre.h"

@implementation UIImage (LSMegre)

+ (UIImage*)ls_megreImageWithArry:(NSArray<UIImage*>*)imageArr andWithEdgeInset:(UIEdgeInsets)Inset andlineSpace:(CGFloat)lineSpace
{
    if (imageArr.count == 0) {
        
        return nil;
    }
    if (imageArr.count == 1) {
        
        return imageArr.firstObject;
    }
    
    CGFloat megreImageWidth = 0.0f;
    CGFloat megreImageHeight = 0.0f;
    //获得合并后的图片的宽高
    for (UIImage *orginImage in imageArr) {
        
        CGImageRef orginImageRef = orginImage.CGImage;
        CGFloat orginWidth = CGImageGetWidth(orginImageRef);
        CGFloat orginHeight = CGImageGetHeight(orginImageRef);
        if (orginWidth > megreImageWidth) {
            megreImageWidth = orginWidth;
        }
        megreImageHeight += orginHeight;
        NSInteger i =[imageArr indexOfObject:orginImage];
        if (i == 0) {
            megreImageHeight +=Inset.bottom;
            megreImageHeight +=Inset.top;
        }else{
           megreImageHeight +=lineSpace;
        }
    }
    
    CGSize mergedSize = CGSizeMake(megreImageWidth+Inset.left+Inset.right, megreImageHeight);

    //画图片
    UIGraphicsBeginImageContext(mergedSize);
    CGFloat DraWImage_Y = Inset.top;
    
    for (UIImage *orginImage in imageArr) {
   
        CGImageRef orginImageRef = orginImage.CGImage;
        CGFloat orginWidth = CGImageGetWidth(orginImageRef);
        CGFloat orginHeight = CGImageGetHeight(orginImageRef);
        [orginImage drawInRect:CGRectMake(Inset.left, DraWImage_Y, orginWidth, orginHeight)];
        DraWImage_Y +=orginHeight;
        
         NSInteger i =[imageArr indexOfObject:orginImage];
        
        if (i!=imageArr.count-1) {
            DraWImage_Y +=lineSpace;
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

+ (UIImage*)ls_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage
{
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
