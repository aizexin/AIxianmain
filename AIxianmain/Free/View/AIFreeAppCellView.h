//
//  AIFreeAppCellView.h
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIFreeAppCellModel;

@interface AIFreeAppCellView : UITableViewCell
/**
 *  背景图片
 */
@property (strong, nonatomic) IBOutlet UIImageView *appbgImageV;
/**
 *  产品图标
 */
@property (strong, nonatomic) IBOutlet UIImageView *productImageV;
/**
 *  名字
 */
@property (strong, nonatomic) IBOutlet UILabel *appNameLabel;
/**
 *  剩余时间
 */
@property (strong, nonatomic) IBOutlet UILabel *appLastTimeLabel;
/**
 *  价格
 */
@property (strong, nonatomic) IBOutlet UILabel *appPriceLabel;
/**
 *  app星级
 */
@property (strong, nonatomic) IBOutlet UIImageView *appStartImageV;
/**
 *  种类
 */
@property (strong, nonatomic) IBOutlet UILabel *appCategoryLabel;

@property(nonatomic,strong)AIFreeAppCellModel *data;
@end
