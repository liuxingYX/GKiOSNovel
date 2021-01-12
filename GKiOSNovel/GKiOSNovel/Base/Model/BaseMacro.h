//
//  BaseMacro.h
//  YiCong
//
//  Created by wangws1990 on 2019/4/16.
//  Copyright © 2019 王炜圣. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SCREEN_WIDTH             [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT            [UIScreen mainScreen].bounds.size.height

#define TAB_BAR_ADDING           [ATRefresh at_tabBar]
#define STATUS_BAR_HIGHT         [ATRefresh at_statusBar]
#define NAVI_BAR_HIGHT           [ATRefresh at_naviBar]

#define SCALEW(value)       ((CGFloat)((SCREEN_WIDTH * (value) / 375.0f)))

#define AppColor                 [UIColor colorWithHexString:[GKAppTheme shareInstance].model.color]
#define Appx252631               [UIColor colorWithRGB:0x252631]
#define Appxdddddd               [UIColor colorWithRGB:0xDDDDDD]
#define Appx000000               [UIColor colorWithRGB:0x000000]
#define Appx333333               [UIColor colorWithRGB:0x333333]
#define Appx666666               [UIColor colorWithRGB:0x666666]
#define Appx999999               [UIColor colorWithRGB:0x999999]
#define Appxf8f8f8               [UIColor colorWithRGB:0xf8f8f8]
#define Appxffffff               [UIColor colorWithRGB:0xffffff]
#define AppRadius                2.50f
#define AppLineHeight            0.60f
#define AppTop                   15.0f

#define placeholders     [UIImage imageNamed:@"placeholder_big"]
#define placeholdersmall [UIImage imageNamed:@"placeholder_small"]

#pragma mark login
#define BaseUrl      @"https://api.zhuishushenqi.com/"
#define BaseUrlIcon  @"https://statics.zhuishushenqi.com"

#define kBaseUrl(url)      [NSString stringWithFormat:@"%@%@", BaseUrl, url]
#define kBaseUrlIcon(url)  [NSString stringWithFormat:@"%@%@", BaseUrlIcon, url]

#define BaseAssert(url) assert(url)

#define RefreshPageStart (1)
#define RefreshPageSize (20)

#ifdef DEBUG
    #ifndef NSLog
    #define NSLog(...)
#endif

#endif
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, GKUserState) {
    GKUserBoy =  1,
    GKUserGirl = 2,
};

typedef NS_ENUM(NSInteger, GKLoadDataState) {
    GKLoadDataNone    =  0,
    GKLoadDataNetData =  1 << 1,
    GKLoadDataDataBase=  1 << 2,
    GKLoadDataDefault = (GKLoadDataNetData|GKLoadDataDataBase),
};

#define WChatAppKey              @"wxe35a091b90ec0d31"//微信平台appKey
#define QQAppKey                 @"1109550572" //设置QQ平台的appID

@interface BaseMacro : NSObject
+ (NSArray *)hotDatas;
+ (CGRect)appFrame;
+ (NSString *)fontName;
@end
NS_ASSUME_NONNULL_END
