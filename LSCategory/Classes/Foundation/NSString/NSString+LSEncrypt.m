//
//  NSString+LSEncrypt.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSString+LSEncrypt.h"
#import "CommonCrypto/CommonDigest.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (LSEncrypt)

- (NSString *)ls_md5 {
    
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr,(CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

- (NSString *)ls_base64String3DesCbcDecryptWithSecretKey:(NSString *)secretKey offset:(NSString *)offset {
    
    NSData *cipherData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    size_t bufferSize = cipherData.length + kCCBlockSize3DES;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    
    char keyPtr[kCCKeySize3DES + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [secretKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSize3DES + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [offset getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithm3DES,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySize3DES,
                                          ivPtr,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    NSString *plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [NSString stringWithUTF8String:[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] UTF8String]];
    }
    free(buffer);
    return plainText;
}

- (NSString *)ls_base64StringAes128CbcDecryptWithSecretKey:(NSString *)secretKey offset:(NSString *)offset {
    
    NSData *cipherData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    size_t bufferSize = cipherData.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [secretKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [offset getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    NSString *plainText = nil;
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
@end
