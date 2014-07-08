//
//  FlickrPhotoHeaderView.h
//  Flickr Search
//
//  Created by Perry on 14-7-8.
//  Copyright (c) 2014年 perry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotoHeaderView : UICollectionReusableView
@property (weak) IBOutlet UIImageView *backgroundImageView;
@property (weak) IBOutlet UILabel *searchLabel;

- (void)setSearchText:(NSString *)text;

@end
