//
//  AIFreeAppCellView.m
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFreeAppCellView.h"
#import "AIFreeAppCellModel.h"

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
    self.appbgImageV.image = [UIImage imageNamed:data.bgImageName];
#warning mark -把cell对应的值全部填上
}
@end
