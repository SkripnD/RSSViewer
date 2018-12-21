//
//  FeedsListViewController.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "FeedsListViewController.h"
#import "FeedListTableViewCell.h"
#import "RssSource+CoreDataProperties.h"

static NSString * kCellFeedSourceIdentifier = @"FeedListTableViewCell";

@interface FeedsListViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSArray * feedSources;

@end

@implementation FeedsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.presenter startFetchFeedSources];
}


#pragma mark - FeedsListViewProtocol

- (void) showFeedSources:(NSArray *)feedSources {
    self.feedSources = feedSources;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate / UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedSources count];
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellFeedSourceIdentifier];
    [cell updateWith:[self.feedSources objectAtIndex:indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
