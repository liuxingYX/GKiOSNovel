//
//  GKJumpApp.m
//  GKiOSNovel
//
//  Created by wangws1990 on 2019/6/13.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKJumpApp.h"
#import "GKStartViewController.h"
#import "GKBookDetailContentController.h"
#import "GKBookListDetailController.h"
#import "GKMineSelectController.h"
#import "GKReadViewController.h"
#import "GKReadContentController.h"
#import "GKBookHistoryController.h"
#import "GKBooCaseController.h"
#import "GKNovelTabBarController.h"
#import "GKLaunchController.h"
@implementation GKJumpApp
+ (void)jumpToAppGuidePage:(void(^)(void))completion
{
    BOOL res = [GKUserManager alreadySelect];
    if (!res) {
        [GKJumpApp window].rootViewController = [GKStartViewController vcWithCompletion:completion];
    }else
    {
        [GKJumpApp window].rootViewController = [GKLaunchController vcWithCompletion:completion];
    }
}
+ (void)jumpToBookDetail:(NSString *)bookId{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKBookDetailContentController *vc = [GKBookDetailContentController vcWithConfig:bookId];
    vc.hidesBottomBarWhenPushed = YES;
//    NSArray <UIViewController *>*list =  nvc.navigationController.viewControllers;
//    NSMutableArray *vcs = @[].mutableCopy;
//    [list enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (![obj isKindOfClass:GKBookDetailController.class]) {
//            [vcs addObject:obj];
//        }
//    }];
//    [vcs addObject:vc];
//    [nvc.navigationController setViewControllers:vcs animated:YES];
    [nvc.navigationController pushViewController:vc animated:YES];
}
+ (void)jumpToBookListDetail:(NSString *)bookId{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKBookListDetailController *vc = [GKBookListDetailController vcWithBookId:bookId];
    vc.hidesBottomBarWhenPushed = YES;
//    NSArray <UIViewController *>*list =  nvc.navigationController.viewControllers;
//    NSMutableArray *vcs = @[].mutableCopy;
//    [list enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (![obj isKindOfClass:GKBookListDetailController.class]) {
//            [vcs addObject:obj];
//        }
//    }];
//    [vcs addObject:vc];
//    [nvc.navigationController setViewControllers:vcs animated:YES];
    [nvc.navigationController pushViewController:vc animated:YES];
}
+ (void)jumpToAddSelect{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKMineSelectController *vc = [[GKMineSelectController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [nvc.navigationController pushViewController:vc animated:YES];
}
+ (void)jumpToBookRead:(GKBookDetailModel *)model{
    [GKJumpApp jumpToBookRead:model chapter:0];
}
+ (void)jumpToBookRead:(GKBookDetailModel *)model chapter:(NSInteger)chapter{
    UIViewController *root = [UIViewController rootTopPresentedController];
    
    GKReadContentController *vc = [GKReadContentController vcWithBookDetailModel:model chapter:chapter];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    vc.hidesBottomBarWhenPushed = YES;
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [root presentViewController:nav animated:NO completion:nil];
}
+ (void)jumpToBookCase{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKBooCaseController *vc = [[GKBooCaseController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [nvc.navigationController pushViewController:vc animated:YES];
}
+ (void)jumpToBookHistory{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKBookHistoryController *vc = [[GKBookHistoryController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
     [nvc.navigationController pushViewController:vc animated:YES];
}
+ (void)setAppLaunchController{
    UIViewController *root = [UIViewController rootTopPresentedController];
    GKLaunchController *launchController = [[GKLaunchController alloc]init];
    launchController.modalPresentationStyle = UIModalPresentationFullScreen;
    BaseNavigationController *nvc = [[BaseNavigationController alloc] initWithRootViewController:launchController];
    nvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [root presentViewController:nvc animated:NO completion:nil];
}
+  (UIWindow *)window
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }else
    {
        return [app keyWindow];
    }
}
+ (void)jumpToAppTheme{
    [GKJumpApp window].rootViewController =  [[GKNovelTabBarController alloc] init];
}

@end
