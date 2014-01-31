//
//  CFDetailViewController.m
//  client
//
//  Created by John Clem on 1/31/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CFDetailViewController.h"

@interface CFDetailViewController ()

@property (nonatomic, weak) IBOutlet UITextView *contentTextView;

@end

@implementation CFDetailViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_post) {
        [_contentTextView setText:_post.content];
        [self.navigationItem setTitle:_post.title];
    }
}
@end
