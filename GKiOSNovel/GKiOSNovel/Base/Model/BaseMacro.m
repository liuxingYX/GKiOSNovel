//
//  BaseMacro.m
//  YiCong
//
//  Created by wangws1990 on 2019/4/16.
//  Copyright © 2019 王炜圣. All rights reserved.
//

#import "BaseMacro.h"

@implementation BaseMacro
+ (NSArray *)hotDatas{
    return @[@"心梦无恒",@"辰东",@"我吃西红柿",@"唐家三少",@"天蚕土豆",@"耳根",@"烟雨江南",@"梦入神机",@"骷髅精灵",@"完美世界",@"大主宰",@"斗破苍穹",@"斗罗大陆",@"如果蜗牛有爱情",@"极品家丁",@"择天记",@"神墓",@"遮天",@"太古神王",@"帝霸",@"校花的贴身高手",@"武动乾坤"];
}
+ (CGRect)appFrame{

    BOOL  landscape = [GKSetManager shareInstance].model.landscape;
    if (landscape) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
        if (@available(iOS 11.0, *)) {
            insets = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
        }
        return CGRectMake(AppTop + insets.left, insets.top + 10 + 25, SCREEN_HEIGHT - AppTop*2 -insets.left -insets.right, SCREEN_WIDTH - insets.top - insets.bottom - 50);
    }
    return CGRectMake(AppTop, STATUS_BAR_HIGHT + 30, SCREEN_WIDTH - 30, SCREEN_HEIGHT - STATUS_BAR_HIGHT - TAB_BAR_ADDING - 30 - 30);
}
+ (NSString *)fontName{
    return @"PingFang-SC-Regular";
}
@end
