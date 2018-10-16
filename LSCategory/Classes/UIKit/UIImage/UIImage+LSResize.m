//
//  UIImage+LSResize.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIImage+LSResize.h"

@implementation UIImage (LSResize)

- (UIImage *)ls_imageScaledToSize:(CGSize)size
{
    //avoid redundant drawing
    if (CGSizeEqualToSize(self.size, size))
    {
        return self;
    }
    
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

- (UIImage *)ls_imageScaledToFitSize:(CGSize)size
{
    //calculate rect
    CGFloat aspect = self.size.width / self.size.height;
    if (size.width / aspect <= size.height)
    {
        return [self ls_imageScaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [self ls_imageScaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}

- (UIImage *)ls_scaleWithWidth:(CGFloat)widthMax
{
     CGFloat width = self.size.width;
    if (width > widthMax) {
        CGFloat height = self.size.height;
        CGFloat heightMax = widthMax * height / width;
        CGSize size = CGSizeMake(widthMax, heightMax);
        return [self ls_imageScaledToSize:size];
    }
    return self;
}


- (UIImage *)ls_scaleWithHeight:(CGFloat)HeightMax
{
    CGFloat height = self.size.height;
    if (height > HeightMax) {
        CGFloat width = self.size.width;
        CGFloat widhtMax = HeightMax * width / height;
        CGSize size = CGSizeMake(widhtMax, HeightMax);
        return [self ls_imageScaledToSize:size];
    }
    return self;
}

- (UIImage *)ls_imageScaledToFillSize:(CGSize)size
{
    if (CGSizeEqualToSize(self.size, size))
    {
        return self;
    }
    //calculate rect
    CGFloat aspect = self.size.width / self.size.height;
    if (size.width / aspect >= size.height)
    {
        return [self ls_imageScaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [self ls_imageScaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}

- (UIImage *)ls_compressToByte:(NSUInteger)maxLength
{
    if (!self) {
        return nil;
    }
    UIImage *image = self;
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}

#pragma mark - 截取当前image对象rect区域内的图像
- (UIImage *)ls_subImageWithRect:(CGRect)rect
{
    CGImageRef newImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    
    return newImage;
}

#pragma mark - 压缩图片至指定像素
- (UIImage *)ls_rescaleImageToPX:(CGFloat )toPX
{
    CGSize size = self.size;
    
    if(size.width <= toPX && size.height <= toPX)
    {
        return self;
    }
    
    CGFloat scale = size.width / size.height;
    
    if(size.width > size.height)
    {
        size.width = toPX;
        size.height = size.width / scale;
    }
    else
    {
        size.height = toPX;
        size.width = size.height * scale;
    }
    
    return [self ls_imageScaledToSize:size];
}

@end
