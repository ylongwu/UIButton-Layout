# UIButton-Layout
An UIButton category for aligning imageView and titleLabel



Example

```
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  CGFloat  spacing = 10.0f;
  [button setImage:[UIImage imageNamed:@"you_image_name"] forState:UIControlStateNormal];
  [button setTitle:@"button_test" forState:UIControlStateNormal];
  
  //[button setButtonImageViewSize:CGSizeMake(50, 50)];
  [button setButtonImageViewPositionType:ImageViewPositionTypeTop imageLabeSpace:spacing];
```
