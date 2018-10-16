//
//  NSData+LSExtension.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LSEncode)

#pragma mark - Encode and decode
/**
  NSData 转 UTF8.
 */
- (NSString *)ls_utf8String;

/**
 NSData 转 NSDictionary or NSArray.
 */
- (id)ls_jsonValueDecoded;

/**
   @brief  字符串base64后转data
   @param string 传入字符串
   @return 传入字符串 base64后的data
 */

+ (NSData *)ls_dataWithBase64EncodedString:(NSString *)string;
/**
   @brief  NSData转string
   @param wrapWidth 换行长度  76  64
   @return base64后的字符串
 */

- (NSString *)ls_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/**
   @brief  NSData转string 换行长度默认64
   @return base64后的字符串
 */
- (NSString *)ls_base64EncodedString;


@end
