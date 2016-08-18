//
//  UIButton+Layout.m
//  Epeisong
//
//  Created by zhanghui on 16/8/3.
//  Copyright © 2016年 zhanghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIButton+Layout.h"

@interface ButtonSetInfo:NSObject
@property(nonatomic, assign)CGSize size;
@property(nonatomic, assign)CGFloat space;
@property(nonatomic, assign)ImageViewPositionType type;
@end


@implementation ButtonSetInfo

@end


@implementation UIButton(Layout)

-(void)setButtonImageViewPositionType:(ImageViewPositionType)type imageLabeSpace:(CGFloat)space
{
    [self setContentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft];
    [self setContentVerticalAlignment: UIControlContentVerticalAlignmentTop];
    [self.titleLabel sizeToFit];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat topinterval = 0;
    CGFloat leftinterval = 0;
    
    CGSize imageviewsize;
    if(self.info)
    {
      imageviewsize= self.info.size;
    }
    else{
        imageviewsize= CGSizeMake(self.imageView.frame.size.width, self.imageView.frame.size.height);
        self.info = [[ButtonSetInfo alloc]init];
        self.info.type=type;
        self.info.space=space;
    }

    
    switch (type) {
        case ImageViewPositionTypeLeft:
            
            topinterval = (self.frame.size.height-imageviewsize.height)/2;
            leftinterval = (self.frame.size.width-imageviewsize.width-self.titleLabel.frame.size.width-space)/2;
            
            [self setTitleEdgeInsets: UIEdgeInsetsMake((self.frame.size.height-self.titleLabel.frame.size.height)/2, leftinterval+imageviewsize.width+space-self.imageView.frame.size.width, 0, 0)];
            
            [self setImageEdgeInsets: UIEdgeInsetsMake(topinterval, leftinterval,topinterval, self.frame.size.width-leftinterval-imageviewsize.width)];
            break;
        case ImageViewPositionTypeRight:
            
            topinterval = (self.frame.size.height-imageviewsize.height)/2;
            leftinterval = (self.frame.size.width - imageviewsize.width-self.titleLabel.frame.size.width-space)/2;
            
            [self setTitleEdgeInsets: UIEdgeInsetsMake((self.frame.size.height-self.titleLabel.frame.size.height)/2, -self.imageView.bounds.size.width+leftinterval, 0, 0)];
            
            [self setImageEdgeInsets: UIEdgeInsetsMake(topinterval, leftinterval+space+self.titleLabel.frame.size.width,topinterval, leftinterval)];
            
            break;
        case ImageViewPositionTypeTop:
          
            topinterval = (self.frame.size.height-imageviewsize.height-self.titleLabel.frame.size.height-space)/2;
            leftinterval = (self.bounds.size.width-imageviewsize.width)/2;
            
            [self setTitleEdgeInsets: UIEdgeInsetsMake(imageviewsize.height+topinterval+space, (self.bounds.size.width-self.titleLabel.bounds.size.width)/2-self.imageView.bounds.size.width, 0, 0)];
            
            [self setImageEdgeInsets: UIEdgeInsetsMake(topinterval, leftinterval, self.frame.size.height-imageviewsize.height-topinterval, leftinterval)];
            
            break;
        case ImageViewPositionTypeBottom:
            
            topinterval = (self.frame.size.height-imageviewsize.height-self.titleLabel.frame.size.height-space)/2;
            
            [self setTitleEdgeInsets: UIEdgeInsetsMake(topinterval, (self.bounds.size.width-self.titleLabel.bounds.size.width)/2-self.imageView.bounds.size.width, 0, 0)];
            
            [self setImageEdgeInsets: UIEdgeInsetsMake(self.titleLabel.frame.size.height+topinterval+space, (self.bounds.size.width-imageviewsize.width)/2,topinterval, (self.bounds.size.width-imageviewsize.width)/2)];
            
            break;
            
        default:
            break;
    }
}


-(void)setButtonImageViewSize:(CGSize)size
{
    if(size.width>self.imageView.frame.size.width) size.width = self.imageView.frame.size.width;
    if(size.height>self.imageView.frame.size.height) size.height = self.imageView.frame.size.height;
    
    if(self.info)
    {
        self.info.size = size;
        [self setButtonImageViewPositionType:self.info.type imageLabeSpace:self.info.space];
    }
    else{
        self.info = [[ButtonSetInfo alloc]init];
        self.info.size = size;
    }

}

- (ButtonSetInfo* )info {
    return objc_getAssociatedObject(self, @selector(info));
}

- (void)setInfo:(ButtonSetInfo* )size {
    objc_setAssociatedObject(self, @selector(info), size, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}





@end