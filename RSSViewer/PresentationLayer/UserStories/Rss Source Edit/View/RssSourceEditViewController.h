//
//  RssSourceEditViewController.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssSourceEditProtocols.h"
#import "RssSourceEditPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssSourceEditViewController : UIViewController<RssSourceEditViewProtocol>

@property (nonatomic) RssSourceEditPresenter *presenter;

@end

NS_ASSUME_NONNULL_END