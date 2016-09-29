//
//  UIBarButtonItem+Category.m
//  MyText
//
//  Created by issuser on 16/2/25.
//  Copyright © 2016年 刘志豪. All rights reserved.
//

#import "UIBarButtonItem+Category.h"
#import "ALActionBlockWrapper.h"
#import <objc/runtime.h>
@implementation UIBarButtonItem (Category)
- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(ALActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithBarButtonSystemItem:systemItem target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style block:(ALActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(ALActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithImage:image style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(ALActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithTitle:title style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (void)setBlock:(ALActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    ALActionBlockWrapper *blockActionWrapper = [[ALActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self setTarget:blockActionWrapper];
    [self setAction:@selector(invokeBlock:)];
}


- (NSMutableArray *)actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, &ALActionBlocksArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &ALActionBlocksArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end
