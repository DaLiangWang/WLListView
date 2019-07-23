//
//  WLCollectionReusableView.m
//  tubaobao
//
//  Created by 王亮 on 2017/8/25.
//  Copyright © 2017年 Rice. All rights reserved.
//

#import "WLCollectionReusableView.h"
#import "WLCollectionViewLayoutAttributes.h"

@interface WLCollectionReusableView ()
@property(nonatomic,strong) UIImageView *imageView;
@end
@implementation WLCollectionReusableView
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.imageView];
        self.imageView.frame = frame;
    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[WLCollectionViewLayoutAttributes class]]) {
        WLCollectionViewLayoutAttributes *attr = (WLCollectionViewLayoutAttributes *)layoutAttributes;
        self.backgroundColor = [UIColor clearColor];
        if (attr.backgroundColor) {
            self.imageView.backgroundColor = attr.backgroundColor;
        }
        else if (attr.backgroundImage) {
            self.imageView.image = attr.backgroundImage;
        }
        else{
//            self.imageView.hidden = YES;
        }
    }
}
@end

