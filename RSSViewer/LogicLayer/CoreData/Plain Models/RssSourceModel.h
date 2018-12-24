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

typedef NS_ENUM(NSInteger, RssSourceModelState) {
    RssSourceModelStateNormal,
    RssSourceModelStateNew
};

@interface RssSourceModel : NSObject<PlainModelMappable>

@property (nonatomic, strong) NSString * hashId;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSDate * dateSynced;
@property (nonatomic, strong) NSDate * dateCreated;
@property (nonatomic) RssSourceModelState modelState;

- (id) initAsNew;

@end

NS_ASSUME_NONNULL_END
