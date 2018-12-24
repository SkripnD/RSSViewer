//
//  RssItemsListViewController.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssItemsListViewController.h"
#import "RssItemTableViewCell.h"
#import "CacheTransaction.h"
#import "RssItemModel.h"

static NSString * kCellRssItemIdentifier = @"RssItemTableViewCell";

@interface RssItemsListViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * rssItems;

@end

@implementation RssItemsListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.sourceTitle;

    self.rssItems = [NSMutableArray new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;

    [self.presenter fetchRssItems];
}


#pragma mark - FeedsListViewProtocol

- (void) didProcessInsertTransactions:(NSOrderedSet<CacheTransaction *> *)transactions {
    NSMutableArray * indexPaths = [NSMutableArray new];
    for (CacheTransaction *transaction in transactions) {
        [indexPaths addObject:transaction.updatedIndexPath];
        [self.rssItems insertObject:transaction.object atIndex:transaction.updatedIndexPath.row];
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
    return [self.rssItems count];
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
    RssItemTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellRssItemIdentifier];
    [cell updateWith:[self.rssItems objectAtIndex:indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //[self.presenter openEditRssControllerFor:indexPath navigationController:self.navigationController];
}


@end
