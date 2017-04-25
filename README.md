## YJPopMenu

![license](https://img.shields.io/npm/l/express.svg)
![version](https://img.shields.io/badge/version-v1.0.0-blue.svg)
[![Gmail](https://img.shields.io/badge/Gmail-guoyanjun.love%40gmail.com-red.svg)](mailto:guoyanjun.love@gmail.com)

* 快速集成YJPopMenu
* 一款菜单选择器/选项卡，类似于微信右上角，点击'+'号后弹出的选项卡

## 效果图
![(演示效果)](http://oniie1tv8.bkt.clouddn.com/YJPopMenu.gif)

## 说明

* 可以选择显示模式，明色和暗色两种色调可供选择

## 使用方法

* 导入YJPopMenu

```
#import "YJPopMenuKit.h"
```

* 遵循`YBPopupMenuDelegate`代理协议

* 类方法

```
NSArray *titleArray = @[@"修改", @"删除", @"扫一扫",@"付款"];
NSArray *iconArray = @[@"pop_menu_motify",@"pop_menu_delete",@"pop_menu_scan",@"pop_menu_pay"];
[YJPopMenu showRelyOnView:button titles:titleArray icons:iconArray menuWidth:120 identifier:@"1" delegate:self];
```
**可以嵌套使用，在代理方法中以标识符`identifier`进行区分**

* 任意区域添加YJPopMenu

```
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView: self.view];
    
    YJPopMenu *popupMenu = [YJPopMenu showAtPoint:p titles:TITLES icons:nil menuWidth:110 delegate:nil];
    popupMenu.dismissOnSelected = NO;
    popupMenu.isShowShadow = YES;
    popupMenu.delegate = self;
    popupMenu.offset = 10;
    popupMenu.type = YJPopMenuTypeDark;
}
```

* Delegate代理方法

```
#pragma mark - YJPopMenuDelegate
- (void)popMenuDidSelectedAtIndex:(NSInteger)index title:(NSString *)title popMenu:(YJPopMenu *)popMenu {
    if ([popMenu.identifier isEqualToString:@"1"]) {
        NSLog(@"点击了===%ld,选项为===%@",(long)index,title);
    }
}
```

## 版本支持

* `xcode7.0+`

* 如果您在使用本库的过程中发现任何bug或者有更好建议，欢迎联系我：[guoyanjun.love@gmail.com](mailto:guoyanjun.love@gmail.com)
