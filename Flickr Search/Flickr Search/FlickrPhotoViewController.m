//
//  FlickrPhotoViewController.m
//  Flickr Search
//
//  Created by Perry on 14-7-8.
//  Copyright (c) 2014年 perry. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface FlickrPhotoViewController ()
@property (weak) IBOutlet UIImageView *imageView;
- (IBAction)done:(id)sender;
@end

@implementation FlickrPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.flickrPhoto.largeImage) {
        self.imageView.image = self.flickrPhoto.largeImage;
    } else {
        self.imageView.image = self.flickrPhoto.thumbnail;
        
        [Flickr loadImageForPhoto:self.flickrPhoto thumbnail:NO completionBlock:^(UIImage *photoImage, NSError *error) {
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.imageView.image = self.flickrPhoto.largeImage;
                });
            }
        }];
    }
}

- (IBAction)done:(id)sender
{
    // TODO
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
