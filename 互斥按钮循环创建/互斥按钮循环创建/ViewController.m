//
//  ViewController.m
//  互斥按钮循环创建
//
//  Created by 闫继祥 on 2019/7/18.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "ViewController.h"
#import "CustomButtonView.h"
#import "UIColor+YMHex.h"
@interface ViewController ()
@property (nonatomic,strong)CustomButtonView *btnView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.btnView.titleArr = @[@"膜拜单车",@"哈罗单车",@"轻骑单车",@"悟空单车",@"滴滴单车",@"美团单车",@"ofo单车",@"你猜单车",@"其他单车",@"凤凰单车",@"顺丰单车",@"中通单车",@"天天单车",@"圆通单车",@"韵达单车"];
    
    [self.view addSubview:_btnView];
    NSLog(@"%@",self.btnView.selectedMarkArray);
    
    __weak typeof(self) weakSelf = self;
    _btnView.buttonAction = ^(YSLCustomButton * _Nullable sender) {
        NSLog(@"%@",weakSelf.btnView.selectedMarkArray);
        
    };
    
    
}
-(CustomButtonView *)btnView{
    if (!_btnView) {
        _btnView = [[CustomButtonView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 0)];
        _btnView.backColor = [UIColor whiteColor];
        _btnView.cornerRadiu = 2.0;
        _btnView.rowNum = @"4";
        _btnView.selectColor = [UIColor colorWithHexString:@"#eeeeee"];
        //        _btnView.nomorlColor = [UIColor greenColor];
        _btnView.selectIndex = @"2";
        _btnView.selectTitleColor = [UIColor blackColor];
        //        _btnView.nomorlTitleColor = [UIColor darkGrayColor];
        //        _btnView.fontSize = [UIFont systemFontOfSize:20];
        //        _btnView.MarginY = 30;
        //        _btnView.MarginX = 40;
        _btnView.isMuli = YES;
    }
    return _btnView;
}

@end
