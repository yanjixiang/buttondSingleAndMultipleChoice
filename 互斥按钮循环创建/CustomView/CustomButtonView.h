//
//  CustomButtonView.h
//  互斥按钮循环创建
//
//  Created by 闫继祥 on 2019/7/18.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSLCustomButton.h"

typedef void (^buttonClickBlcok)(YSLCustomButton * _Nullable sender);
NS_ASSUME_NONNULL_BEGIN

@interface CustomButtonView : UIView

@property (nonatomic,copy) buttonClickBlcok buttonAction;

//列数
@property (nonatomic,copy) NSString *rowNum;

//默认选中下标
@property (nonatomic,copy) NSString *selectIndex;

//数据
@property (nonatomic,strong) NSArray *titleArr;

//选中背景颜色
@property (nonatomic,strong) UIColor *selectColor;

//正常背景颜色
@property (nonatomic,strong) UIColor *nomorlColor;

//字体大小
@property (nonatomic ,strong) UIFont *fontSize;

//正常字体颜色
@property (nonatomic ,strong) UIColor *nomorlTitleColor;

//选中字体颜色
@property (nonatomic ,strong) UIColor *selectTitleColor;

//view背景颜色
@property (nonatomic,strong) UIColor *backColor;

//按钮圆角大小
@property (nonatomic,assign) CGFloat cornerRadiu;

//button行间距
@property (nonatomic,assign) CGFloat MarginX;

//button列间距
@property (nonatomic,assign) CGFloat MarginY;

//是否多选
@property (nonatomic,assign) BOOL isMuli;

//多选
// 选中标签数组(数字)
@property (nonatomic, strong) NSMutableArray *selectedMarkArray;

@end

NS_ASSUME_NONNULL_END
