//
//  FlickrPhotoCell.m
//  Flickr Search
//
//  Created by Perry on 14-7-8.
//  Copyright (c) 2014年 perry. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlickrPhotoCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        bgView.backgroundColor = [UIColor blueColor];
        bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
        bgView.layer.borderWidth = 4;
        self.selectedBackgroundView = bgView;
    }
    return self;
}

- (void)setupThePhoto:(FlickrPhoto *)tempPhoto
{
    self.imageView.image = tempPhoto.thumbnail;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
