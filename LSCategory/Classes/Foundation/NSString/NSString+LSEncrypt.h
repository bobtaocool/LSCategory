//
//  NSString+LSEncrypt.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSEncrypt)

/**
 MD5加密
 */
- (NSString *)ls_md5;

/**
 将base64格式的字符串通过3DES CBC的加密模式解密
 @note 调用此方法的字符串必须是通过3DES CBC的加密模式加密出来的base64格式的字符串
 @param secretKey 密钥
 @param offset 偏移量
 @return 解密后的字符串
 */
- (NSString *)ls_base64String3DesCbcDecryptWithSecretKey:(NSString *)secretKey offset:(NSString *)offset;

/**
 将base64格式的字符串通过 AES 128 CBC的加密模式进行解密
 @param secretKey 密钥
 @param offset 偏移量
 @return 解密后的字符串
 */
- (NSString *)ls_base64StringAes128CbcDecryptWithSecretKey:(NSString *)secretKey offset:(NSString *)offset;

@end
