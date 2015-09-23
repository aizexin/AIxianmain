//
//  AIFreeAppCellView.m
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFreeAppCellView.h"
#import "AIFreeAppCellModel.h"
#import "UIImageView+AFNetworking.h"
@implementation AIFreeAppCellView

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(AIFreeAppCellModel *)data{
    _data = data;
    //背景
//    self.appbgImageV.image = [UIImage imageNamed:data.bgImageName];
    //头像
    NSURL *iconImageUrl = [NSURL URLWithString:data.iconUrl];
    [_appIconImageV setImageWithURL:iconImageUrl placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    //名字
    _appNameLabel.text = data.name;
    //剩余时间
    _appLastTimeLabel.text = data.expireDatetime;
    //价格
    _appPriceLabel.text = data.lastPrice;
    //种类
    _appCategoryLabel.text = data.categoryName;
    //星级图片
    float startNum = [data.starCurrent floatValue];
    UIImage *startImage = [UIImage imageNamed:@"StarsForeground"];
    CGRect rect = CGRectMake(0, 0, 65 * 0.2 *startNum, 23);
    // 剪切默认状态的图片
    CGImageRef norCGImageRef= CGImageCreateWithImageInRect(startImage.CGImage, rect);
    // 将切割好的图片转换为uiimage设置为按钮的背景
//    [btn setImage:[UIImage imageWithCGImage:norCGImageRef]  forState:UIControlStateNormal];
    _appStartImageV.image = [[UIImage imageWithCGImage:norCGImageRef]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //分享
    _appShareNumLabel.text = [NSString stringWithFormat:@"分享：%@次",data.shares];
    //收藏
    _appCollectNumLabel.text = [NSString stringWithFormat:@"收藏%@次",data.favorites];
    //下载
    _appDownNumLabel.text = [NSString stringWithFormat:@"下载%@次",data.downloads];
    //背景图片
//    _appbgImageV.image = [UIImage imageNamed:data.bgImageName];
    
}
@end
