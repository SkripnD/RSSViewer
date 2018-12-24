//
//  FeedsListInteractor.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedsListProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedsListInteractor : NSObject<FeedsListInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<FeedsListInteractorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
