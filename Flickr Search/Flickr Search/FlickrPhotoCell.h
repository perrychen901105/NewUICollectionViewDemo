//
//  FlickrPhotoCell.h
//  Flickr Search
//
//  Created by Perry on 14-7-8.
//  Copyright (c) 2014年 perry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"

@interface FlickrPhotoCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;

- (void)setupThePhoto:(FlickrPhoto *)tempPhoto;

@end
