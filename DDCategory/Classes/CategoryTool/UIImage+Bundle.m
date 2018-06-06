//
//  UIImage+Bundle.m
//  Pods
//
//  Created by FTY on 2018/6/2.
//

#import "UIImage+Bundle.h"
#import "DDBundleTool.h"

@implementation UIImage (Bundle)

+ (instancetype)dd_imageWithName:(NSString *)imageName{
    
    NSString *path = [DDBundleTool dd_imagePathWithImageName:imageName];
    return path ? [UIImage imageWithContentsOfFile:path] : nil;
}


@end
