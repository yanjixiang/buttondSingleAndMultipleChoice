//
//  CustomButtonView.m
//  互斥按钮循环创建
//
//  Created by 闫继祥 on 2019/7/18.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "CustomButtonView.h"
#import "UIColor+YMHex.h"

//按钮高度
#define h 40
@interface CustomButtonView ()

//选中按钮
@property (nonatomic,strong)YSLCustomButton *selectBtn;


@end
@implementation CustomButtonView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    
    if (_rowNum.length == 0) {
        _rowNum = @"5";
    }
    if (self.backColor == nil||self.backColor==NULL) {
        self.backColor = [UIColor whiteColor];
    }
    if (self.selectColor == nil||self.selectColor==NULL) {
        self.selectColor = [UIColor orangeColor];
    }
    if (self.nomorlColor == nil||self.nomorlColor==NULL) {
        self.nomorlColor = [UIColor colorWithHexString:@"#eeeeee"];
    }
    if (self.nomorlTitleColor == nil||self.nomorlTitleColor==NULL) {
        self.nomorlTitleColor = [UIColor blackColor];
    }
    if (self.selectTitleColor == nil||self.selectTitleColor==NULL) {
        self.selectTitleColor = [UIColor whiteColor];
    }
    if (self.fontSize == nil||self.fontSize==NULL) {
        self.fontSize = [UIFont systemFontOfSize:15];
    }
    if (self.MarginX == 0) {
        self.MarginX = 10;
    }
    if (self.MarginY == 0) {
        self.MarginY = 10;
    }
    CGFloat w = (self.frame.size.width - ([_rowNum intValue] + 1) * self.MarginX)/[_rowNum intValue];
    for (int i = 0; i<titleArr.count; i++) {
        int row = i / [_rowNum intValue];
        int loc = i % [_rowNum intValue];
        CGFloat x = (w) * loc + self.MarginX * (loc+1);
        CGFloat y = (h) * row + self.MarginY * (row + 1);
        YSLCustomButton *btn = [YSLCustomButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = CGRectMake(x, y, w, h);
        btn.backgroundColor = self.nomorlColor;
        [btn setTitleColor:self.nomorlTitleColor forState:(UIControlStateNormal)];
        btn.titleLabel.font = self.fontSize;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"nomorl"] forState:(UIControlStateNormal)];
        btn.layer.cornerRadius = self.cornerRadiu;
        if (_selectIndex.length == 0) {
            
        }else {
            //设置默认选中项
            if (btn.tag == [_selectIndex intValue]) {
                btn.backgroundColor = self.selectColor;
                [btn setTitleColor:self.selectTitleColor forState:(UIControlStateNormal)];
                [btn setImage:[UIImage imageNamed:@"select"] forState:(UIControlStateNormal)];
                btn.selected = YES;
                self.selectBtn = btn;
                [self.selectedMarkArray addObject:[NSString stringWithFormat:@"%@",_selectIndex]];
            }else {
                
            }
            
        }
        btn.ysl_spacing = 2.0;
        btn.ysl_buttonType = YSLCustomButtonImageLeft;
        
    }
    CGRect rectSize = self.frame;
    
    if ([titleArr isKindOfClass:[NSArray class]]&&titleArr.count!=0) {
        NSInteger rows = titleArr.count / [_rowNum intValue];
        if (titleArr.count) {
            if ( titleArr.count % [_rowNum intValue]!=0) {
                rows += 1;
            }
            rectSize.size.height +=  rows * w  + (rows-1) * 10; // 图片高度 + 间隙
        }
    }
    self.frame = rectSize;
    self.backgroundColor = self.backColor;
    
}

// 单选 在点击事件中，以一个static变量记录instance
- (void)btnClick:(YSLCustomButton *)sender {
    if (_isMuli == YES) {
        //多选
        sender.selected = !sender.selected;
        if (sender.isSelected) {
            sender.backgroundColor = self.selectColor;
            [sender setTitleColor:self.selectTitleColor forState:(UIControlStateNormal)];
            [sender setImage:[UIImage imageNamed:@"select"] forState:(UIControlStateNormal)];
            
            [self.selectedMarkArray addObject:[NSString stringWithFormat:@"%ld",sender.tag]];
        } else {
            sender.backgroundColor = self.nomorlColor;
            [sender setTitleColor:self.nomorlTitleColor forState:(UIControlStateNormal)];
            [sender setImage:[UIImage imageNamed:@"nomorl"] forState:(UIControlStateNormal)];
            
            [self.selectedMarkArray removeObject:[NSString stringWithFormat:@"%ld",sender.tag]];
            
        }
        
    }else {
        //单选
        //self.selectBtn上个按钮，也为临时按钮
        //这里为设置按钮的字体颜色，如果不需要改变按钮的背景颜色，即只需要改变selected的值，不需要再判断临时按钮和当前按钮是否一样
        self.selectBtn.selected = NO;
        sender.selected=YES;
        //这里为设置按钮的背景颜色
        if (self.selectBtn == sender) {
            
        }else{
            sender.backgroundColor = self.selectColor;
            [sender setTitleColor:self.selectTitleColor forState:(UIControlStateNormal)];
            [sender setImage:[UIImage imageNamed:@"select"] forState:(UIControlStateNormal)];
            
            self.selectBtn.backgroundColor = self.nomorlColor;
            [self.selectBtn setTitleColor:self.nomorlTitleColor forState:(UIControlStateNormal)];
            [self.selectBtn setImage:[UIImage imageNamed:@"nomorl"] forState:(UIControlStateNormal)];
            
        }
        self.selectBtn = sender;
        // 判断下这个block在控制其中有没有被实现
        
    }
    if (self.buttonAction) {
        // 调用block传入参数
        self.buttonAction(self.selectBtn);
    }
}
- (NSMutableArray *)selectedMarkArray {
    if (!_selectedMarkArray) {
        _selectedMarkArray = [NSMutableArray array];
        
    }
    return _selectedMarkArray;
}


@end
