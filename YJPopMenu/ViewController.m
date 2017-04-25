//
//  ViewController.m
//  YJPopMenu
//
//  Created by GuoYanjun on 2016/8/01.
//  Copyright © 2016年 GuoYanjun. All rights reserved.
//

#import "ViewController.h"
#import "YJPopMenuKit.h"

#define titleArray @[@"修改", @"删除", @"扫一扫",@"付款"]
#define iconArray @[@"pop_menu_motify",@"pop_menu_delete",@"pop_menu_scan",@"pop_menu_pay"]
@interface ViewController ()<YJPopMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onPopMenuClick:(UIButton *)sender {
    YJPopMenu *popMenu = [YJPopMenu showRelyOnView:sender titles:titleArray icons:iconArray menuWidth:120 identifier:@"1" delegate:self];
    popMenu.fontSize = 14.0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView: self.view];
    
    YJPopMenu *popupMenu = [YJPopMenu showAtPoint:point titles:titleArray icons:nil menuWidth:120 identifier:@"1" delegate:self];
    popupMenu.dismissOnSelected = NO;
    popupMenu.isShowShadow = YES;
    popupMenu.delegate = self;
    popupMenu.offset = 10;
    popupMenu.type = YJPopMenuTypeDark;
}

#pragma mark - YJPopMenuDelegate
- (void)popMenuDidSelectedAtIndex:(NSInteger)index title:(NSString *)title popMenu:(YJPopMenu *)popMenu {
    if ([popMenu.identifier isEqualToString:@"1"]) {
        NSLog(@"点击了===%ld,选项为===%@",(long)index,title);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
