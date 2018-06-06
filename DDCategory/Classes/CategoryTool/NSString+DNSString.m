//
//  NSString+DNSString.m
//  DFrame
//
//  Created by DaiSuke on 16/8/22.
//  Copyright © 2016年 DaiSuke. All rights reserved.
//

#import "NSString+DNSString.h"
#import <CommonCrypto/CommonDigest.h>

static NSString *token = @"fashfkdashfjkldashfjkdashfjkdahsfjdasjkvcxnm%^&%^$&^uireqwyi1237281643";

@implementation NSString (DNSString)





- (CGSize)sizeCustomWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize resultSize;
    if([self respondsToSelector:@selector(sizeWithAttributes:)]){
        NSDictionary *attributes = @{NSFontAttributeName: font};
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
        resultSize.width = ceilf(rect.size.width);
        resultSize.height = ceilf(rect.size.height);
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        resultSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return resultSize;
}


- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}

- (CGSize)sizeWithFont:(UIFont *)font{
    return [self sizeWithFont:font maxWidth:MAXFLOAT];
}


- (NSString *)myMD5
{
    NSString *str = [NSString stringWithFormat:@"%@%@", self, token];
    
    return [str MD5];
}

#pragma mark 使用MD5加密字符串
- (NSString *)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (uint32_t)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

#pragma mark 使用SHA1加密字符串
- (NSString *)SHA1
{
    const char *cStr = [self UTF8String];
    NSData *data = [NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (uint32_t)data.length, digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

@end
