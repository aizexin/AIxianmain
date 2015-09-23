//
//  AITabBar.h
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AITabBarBtn;
@protocol AITabBarDelegate <NSObject>

-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to;

@end



@interface AITabBar : UIView

-(void)addTabBarButtonWithImageName:(NSString*)norName andDisableImageName:(NSString*)disName;

@property(nonatomic,weak)id<AITabBarDelegate> delegate;

@end
