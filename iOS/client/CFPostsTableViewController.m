//
//  CFPostsTableViewController.m
//  client
//
//  Created by John Clem on 1/31/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CFPostsTableViewController.h"
#import "CFDetailViewController.h"
#import "Post.h"

@interface CFPostsTableViewController ()

@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation CFPostsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _posts = [NSMutableArray new];
    
    [Post remoteAllAsync:^(NSArray *allRemote, NSError *error) {
        if (error) {
            NSLog(@"Error fetching posts: %@", error);
        } else {
            for (Post *post in allRemote) {
                [_posts addObject:post];
            }
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Post *post = [_posts objectAtIndex:indexPath.row];
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = post.author;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Post *post = _posts[indexPath.row];
        [post remoteDestroy:nil];
        [_posts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[CFDetailViewController class]]) {
        [segue.destinationViewController setPost:[_posts objectAtIndex:[self.tableView indexPathForSelectedRow].row]];
    }
}

@end
