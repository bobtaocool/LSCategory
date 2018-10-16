//
//  NSObject+LSReflection.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//  获取类的基本信息

#import <Foundation/Foundation.h>

@interface NSObject (LSReflection)

/** 获取类名*/
- (NSString *)ls_className;

/** 获取父类名称*/
- (NSString *)ls_superClassName;
+ (NSString *)ls_superClassName;

/** 获取实例属性字典*/
-(NSDictionary *)ls_propertyDictionary;

/** 获取属性名称列表*/
- (NSArray*)ls_propertyKeys;
+ (NSArray *)ls_propertyKeys;

/** 获取方法列表*/
-(NSArray*)ls_methodList;
+(NSArray*)ls_methodList;
-(NSArray*)ls_methodListInfo;

/** 获取协议列表*/
-(NSDictionary *)ls_protocolList;
+ (NSDictionary *)ls_protocolList;

@end
