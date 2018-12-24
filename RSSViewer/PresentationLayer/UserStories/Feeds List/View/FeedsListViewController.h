//
//  FeedsListViewController.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedsListProtocols.h"
#import "FeedsListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedsListViewController : UIViewController<FeedsListViewProtocol>

@property (nonatomic) FeedsListPresenter *presenter;

@end

NS_ASSUME_NONNULL_END