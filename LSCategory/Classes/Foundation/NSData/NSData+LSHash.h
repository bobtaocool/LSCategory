//
//  NSData+LSHash.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LSHash)

/**
 NSData 转 md5字符串
 */
- (NSString *)ls_md5String;

/**
  NSData 转 md5 
 */
- (NSData *)ls_md5Data;

@end
