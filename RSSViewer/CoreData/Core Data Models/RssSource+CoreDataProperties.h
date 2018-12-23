//
//  RssSource+CoreDataProperties.h
//  
//
//  Created by Denis Skripnichenko on 21.12.2018.
//
//

#import "RssSource+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface RssSource (CoreDataProperties)

+ (NSFetchRequest<RssSource *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateCreated;
@property (nullable, nonatomic, copy) NSDate *dateSynced;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
