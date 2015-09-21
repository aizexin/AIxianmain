//
//  AIBaseNavController.m
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIBaseNavController.h"
#import "AIDefine.h"
@interface AIBaseNavController ()

@end

@implementation AIBaseNavController

//该类第一次用到的时候调用
+(void)initialize{
    //1.设置导航条主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    //1.1设置导航栏背景图
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forBarMetrics:(UIBarMetricsDefault)];
    //设置导航栏返回按钮的图片的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    //1.2设置所有导航条的标题颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    md[NSForegroundColorAttributeName] = TitleColor;
    [navBar setTitleTextAttributes:md];
    
    //1.3设置UIBarButtonItem的主题
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    //设置普通按钮
    UIImage *norImage = [UIImage imageNamed:@"buttonbar_action"];
    [barItem setBackgroundImage:norImage forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
    
    //设置返回按钮
    UIImage *norBackImage = [UIImage imageNamed:@"buttonbar_back"];
    [barItem setBackButtonBackgroundImage:norBackImage forState:(UIControlStateNormal
                                                                 ) barMetrics:(UIBarMetricsDefault)];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //拿到目标控制器设置tabar为隐藏
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
