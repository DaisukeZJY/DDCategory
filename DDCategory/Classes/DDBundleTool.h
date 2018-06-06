//
//  DDBundleTool.h
//  Pods
//
//  Created by FTY on 2018/6/4.
//

#import <Foundation/Foundation.h>

@interface DDBundleTool : NSObject

/// 获取组件下的bundle
+ (NSBundle *)dd_currentMainBundle;
/// 获取组件下图片路径
+ (NSString *)dd_imagePathWithImageName:(NSString *)imageName;


@end
