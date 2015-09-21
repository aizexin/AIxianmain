//
//  AITabBar.m
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AITabBar.h"
#import "AITabBarBtn.h"

@interface AITabBar ()
@property(nonatomic , weak)AITabBarBtn *selBtn;
@end

@implementation AITabBar

-(void)addTabBarButtonWithImageName:(NSString*)norName andDisableImageName:(NSString*)disName{
    AITabBarBtn *btn = [[AITabBarBtn alloc]init];
    
    //设置正常图片
    [btn setImage:[UIImage imageNamed:norName] forState:(UIControlStateNormal)];
    //设置不可以用状态照片
    [btn setImage:[UIImage imageNamed:disName] forState:(UIControlStateDisabled)];
    
    [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchDown)];
    [self addSubview:btn];
    
    btn.adjustsImageWhenHighlighted = NO;
    
}

//子视图改变的时候调用
-(void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i++) {
        AITabBarBtn *btn = self.subviews[i];
        // 3.3设置frame
        CGFloat btnY = 0;
        CGFloat btnW = self.frame.size.width / self.subviews.count;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 3.8设置按钮的Tag作为将来切换子控制器的索引
        btn.tag = i;
    }
}
-(void)onClickBtn:(AITabBarBtn*)btn{
    // 切换子视图
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:)]) {
        [self.delegate tabBarDidSelectBtnFrom:_selBtn.tag to:btn.tag];
    }
    
    self.selBtn.enabled = YES;
    
    btn.enabled = NO;
    
    self.selBtn = btn;
}
@end









