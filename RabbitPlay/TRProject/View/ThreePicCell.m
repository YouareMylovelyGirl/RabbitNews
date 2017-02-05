//
//  ThreePicCell.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "ThreePicCell.h"

@implementation ThreePicCell

- (UIImageView *)firIV {
    if(_firIV == nil) {
        _firIV = [[UIImageView alloc] init];
        _firIV.contentMode = UIViewContentModeScaleAspectFill;
        _firIV.clipsToBounds = YES;
        [self.contentView addSubview:_firIV];
        [_firIV mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 50) / 3);
            make.left.offset(10);
            make.height.mas_equalTo(145);
            make.bottom.offset(-10);
            make.width.mas_equalTo(width);
        }];
    }
    return _firIV;
}

- (UIImageView *)secIV {
    if(_secIV == nil) {
        _secIV = [[UIImageView alloc] init];
        _secIV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_secIV];
        [_secIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.firIV.mas_right).offset(10);
            make.top.mas_equalTo(self.firIV.mas_top);
            make.bottom.mas_equalTo(self.firIV.mas_bottom);
            make.width.mas_equalTo(self.firIV.mas_width);
        }];
    }
    return _secIV;
}

- (UIImageView *)thiIV {
    if(_thiIV == nil) {
        _thiIV = [[UIImageView alloc] init];
        _thiIV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_thiIV];
        [_thiIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.secIV.mas_right).offset(10);
            make.top.mas_equalTo(self.secIV.mas_top);
            make.bottom.mas_equalTo(self.secIV.mas_bottom);
            make.width.mas_equalTo(self.secIV.mas_width);
        }];
    }
    return _thiIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
//        _titleLb.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
//            make.bottom.mas_equalTo(self.firIV.mas_top).offset(-10);
            make.top.offset(10);
        }];
    }
    return _titleLb;
}

- (UILabel *)numberOfPeo {
    if(_numberOfPeo == nil) {
        _numberOfPeo = [[UILabel alloc] init];
        _numberOfPeo.textColor = [UIColor grayColor];
        _numberOfPeo.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_numberOfPeo];
        [_numberOfPeo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-20);
            make.top.offset(10);
        }];
    }
    return _numberOfPeo;
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
