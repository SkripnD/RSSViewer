//
//  RssSourceModel.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 22.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlainModelMappable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssSourceModel : NSObject<PlainModelMappable>

@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSDate * dateSynced;

@end

NS_ASSUME_NONNULL_END
