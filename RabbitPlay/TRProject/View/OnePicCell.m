//
//  OnePicCell.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "OnePicCell.h"

@implementation OnePicCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.bottom.offset(-10);
            CGFloat scale = 320 / 197.0;
            make.top.offset(10);
            make.bottom.offset(-10);
            make.width.mas_equalTo(_iconIV.mas_height).multipliedBy(scale);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_top).offset(-3);
            make.left.mas_equalTo(self.iconIV.mas_right).offset(15);
        }];
    }
    return _titleLb;
}

- (UILabel *)detailLb {
    if(_detailLb == nil) {
        _detailLb = [[UILabel alloc] init];
        _detailLb.numberOfLines = 2;
        _detailLb.textColor = [UIColor grayColor];
        _detailLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_detailLb];
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).offset(10);
            make.left.mas_equalTo(self.iconIV.mas_right).offset(15);
            make.right.offset(-10);
        }];
    }
    return _detailLb;
}

- (UILabel *)numberOfpeo {
    if(_numberOfpeo == nil) {
        _numberOfpeo = [[UILabel alloc] init];
        _numberOfpeo.textColor = [UIColor grayColor];
        _numberOfpeo.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_numberOfpeo];
        [_numberOfpeo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-20);
            make.bottom.mas_equalTo(self.iconIV);
        }];
    }
    return _numberOfpeo;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
