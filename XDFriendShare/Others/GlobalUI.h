//
//  ViewController.m
//  XDFriendShare
//
//  Created by 郎学东 on 2017/12/1.
//  Copyright © 2017年 郎学东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GlobalUI : NSObject
+ (UIImageView *)createImageViewbgColor:(UIColor *)bgColor;
+ (UILabel *)createLabelFont:(CGFloat )fontsize titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor;
+ (UIButton *)createButtonWithImg:(UIImage *)img title:(NSString *)title titleColor:(UIColor *)titleColor;
@end
