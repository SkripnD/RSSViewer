//
//  FeedsListViewController.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "FeedsListViewController.h"
#import "FeedListTableViewCell.h"
#import "CacheTransaction.h"
#import "RssSourceModel.h"

static NSString * kCellFeedSourceIdentifier = @"FeedListTableViewCell";

@interface FeedsListViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * feedSources;

@end

@implementation FeedsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.feedSources = [NSMutableArray new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;

    [self.presenter startFetchFeedSources];
}


#pragma mark - FeedsListViewProtocol

- (void) didProcessInsertTransactions:(NSOrderedSet<CacheTransaction *> *)transactions {
    NSMutableArray * indexPaths = [NSMutableArray new];
    for (CacheTransaction *transaction in transactions) {
        [indexPaths addObject:transaction.updatedIndexPath];
        [self.feedSources insertObject:transaction.object atIndex:transaction.updatedIndexPath.row];
    }

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void) didProcessUpdateTransactions:(NSOrderedSet<CacheTransaction *> *)transactions {

}

- (void) didProcessDeleteTransactions:(NSOrderedSet<CacheTransaction *> *)transactions {

}

- (void) didProcessMoveTransactions:(NSOrderedSet<CacheTransaction *> *)transactions {

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
    [self.presenter openViewRssControllerFor:indexPath navigationController:self.navigationController];
}


#pragma mark - UI Actions

- (IBAction)addButtonDidTap:(id)sender {
    [self.presenter openNewRssControllerFor:self.navigationController];
}

@end
