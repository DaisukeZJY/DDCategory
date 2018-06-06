//
//  DDBundleTool.m
//  Pods
//
//  Created by FTY on 2018/6/4.
//

#import "DDBundleTool.h"

@implementation DDBundleTool
/// 获取组件下的bundle
+ (NSBundle *)dd_currentMainBundle{
    // 获取的是DDCategory组件下的bundle
    return [NSBundle bundleForClass:self.class];
}

/// 获取组件下图片路径
+ (NSString *)dd_imagePathWithImageName:(NSString *)imageName{
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:self.class];
    NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
    NSString *dir = @"DDCategory.bundle";
    NSString *path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
    // 当scale == 3时，且没有提供3x倍图时，获取2x倍图
    if (path == nil && scale != 2) {
        name = [NSString stringWithFormat:@"%@@2x",imageName];
        path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
    }
    return path;
}

@end
