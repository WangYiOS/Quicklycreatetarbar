//
//  WYTabBarController.m
//  快速创建tabBarController
//
//  Created by 王一 on 16/9/4.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import "WYTabBarController.h"
#import "WYOneViewController.h"
#import "WYTwoViewController.h"
#import "WYThreeViewController.h"

@interface WYTabBarController ()

@end

@implementation WYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加所有子控制器方法
    [self setUpAllChildViewController];
}

/**
 *  添加所有子控制器方法
 */
- (void)setUpAllChildViewController{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 1.添加第一个控制器
    WYOneViewController *oneVC = [[WYOneViewController alloc]init];
    [self setUpOneChildViewController:oneVC image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"第一"];
    
    // 2.添加第2个控制器
    WYTwoViewController *twoVC = [[WYTwoViewController alloc]init];
    [self setUpOneChildViewController:twoVC image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"第二"];
    
    // 3.添加第3个控制器
    WYThreeViewController *threeVC = [[WYThreeViewController alloc]init];
    [self setUpOneChildViewController:threeVC image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"第三"];
}

/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    viewController.tabBarItem.title = title;
    viewController.navigationItem.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:navC];
}

//代码实现不被渲染的方法
//在Assets图片里，已经设置图片不被渲染成蓝色
//这里的代码就不必使用了
//-(UIImage *)RenderingWithString:(NSString *)imageNameString{
//    UIImage *image = [UIImage imageNamed:imageNameString];
//    //不被渲染
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    return image;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
