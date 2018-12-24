//
//  RssItem+CoreDataProperties.m
//  
//
//  Created by Denis Skripnichenko on 24.12.2018.
//
//

#import "RssItem+CoreDataProperties.h"

@implementation RssItem (CoreDataProperties)

+ (NSFetchRequest<RssItem *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"RssItem"];
}

@dynamic dateCreated;
@dynamic descriptionText;
@dynamic guid;
@dynamic link;
@dynamic rssUrl;
@dynamic title;

@end
