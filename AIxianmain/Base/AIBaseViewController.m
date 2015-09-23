//
//  AIBaseViewController.m
//  AIxianmain
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIBaseViewController.h"
#import "AITabBar.h"
@interface AIBaseViewController ()<AITabBarDelegate>

@end

@implementation AIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置自定义tabBar
    AITabBar *tabBar = [[AITabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    NSArray *norImageArray = @[@"tabbar_limitfree",@"tabbar_reduceprice",@"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    NSArray *selImageArray = @[@"tabbar_limitfree_press",@"tabbar_reduceprice_press",@"tabbar_appfree_press",@"tabbar_subject_press",@"tabbar_rank_press"];
    for (int i = 0; i < self.viewControllers.count; i++) {
        [tabBar addTabBarButtonWithImageName:norImageArray[i] andDisableImageName:selImageArray[i]];
    }

    self.selectedIndex = 0;
   
    //添加到自带的tabBar上
    [self.tabBar addSubview:tabBar];
    
}

#pragma mark -AITabBarDelegate
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}




@end
