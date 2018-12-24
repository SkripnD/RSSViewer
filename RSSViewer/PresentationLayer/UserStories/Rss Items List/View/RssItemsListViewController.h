//
//  RssItemsListViewController.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssItemsListProtocols.h"
#import "RssItemsListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssItemsListViewController : UIViewController<RssItemsListViewProtocol>
// TODO: Может лучше стоит передавать через presenter
@property (nonatomic, strong) NSString * sourceTitle;

@property (nonatomic) RssItemsListPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
