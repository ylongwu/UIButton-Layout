//
//  UIButton+Layout.h
//  Epeisong
//
//  Created by zhanghui on 16/8/3.
//  Copyright © 2016年 zhanghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, ImageViewPositionType){
    ImageViewPositionTypeLeft,
    ImageViewPositionTypeRight,
    ImageViewPositionTypeTop,
    ImageViewPositionTypeBottom,
};




@interface UIButton(Layout)
-(void)setButtonImageViewPositionType:(ImageViewPositionType)type imageLabeSpace:(CGFloat)space;
-(void)setButtonImageViewSize:(CGSize)size;

@endgitt