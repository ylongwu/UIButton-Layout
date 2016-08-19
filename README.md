##UIButton-Layout

An UIButton category for aligning imageView and titleLabel

UIButton图片文字的上下布局，可以调整图片的大小和位置，图片和文字的大小不能超过imageView和titleLabel默认的最大值

##Demo

![Demo picture](https://github.com/ylongwu/UIButton-Layout/blob/master/1016066736-2.gif)

##Example

```
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  CGFloat  spacing = 10.0f;
  [button setImage:[UIImage imageNamed:@"you_image_name"] forState:UIControlStateNormal];
  [button setTitle:@"button_test" forState:UIControlStateNormal];
  
  //[button setButtonImageViewSize:CGSizeMake(50, 50)];
  [button setButtonImageViewPositionType:ImageViewPositionTypeTop imageLabeSpace:spacing];
```
