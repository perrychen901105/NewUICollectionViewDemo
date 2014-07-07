//
//  ViewController.m
//  Flickr Search
//
//  Created by chenzhipeng on 14-7-6.
//  Copyright (c) 2014年 perry. All rights reserved.
//

#import "ViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"


@interface ViewController () <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;

@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic, strong) NSMutableArray *searches;
@property(nonatomic, strong) Flickr *flickr;


- (IBAction)shareButtonTapped:(id)sendder;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
    UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
    [self.toolbar setBackgroundImage:navBarImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
    [self.shareButton setBackgroundImage:shareButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *textFieldImage = [[UIImage imageNamed:@"search_field"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.textField setBackground:textFieldImage];
    
    self.searches = [@[]mutableCopy];
    self.searchResults = [@{}mutableCopy];
    self.flickr = [[Flickr alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareButtonTapped:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.flickr searchFlickrForTerm:textField.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
        if (results && [results count] > 0) {
            if (![self.searches containsObject:searchTerm]) {
                NSLog(@"Found %d photos matching %@",[results count],searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results;
            }
            // refresh UI
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        } else {
            NSLog(@"Error searching Flickr: %@",error.localizedDescription);
        }
    }];
    [textField resignFirstResponder];
    return YES;
}


@end
