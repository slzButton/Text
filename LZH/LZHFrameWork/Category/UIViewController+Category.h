//
//  UIViewController+Category.h
//  MyText
//
//  Created by issuser on 16/2/15.
//  Copyright © 2016年 刘志豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)
-(BOOL)isCurrentlyVisible;
-(BOOL)isVisible;
-(void)removeAllChildVC;
-(void)removeAllSubView;

@end
