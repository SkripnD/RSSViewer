//
//  RssSourceEditViewController.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSourceEditViewController.h"
#import "TextInputView.h"

@interface RssSourceEditViewController()
@property (weak, nonatomic) IBOutlet TextInputView *urlInputView;

@end

@implementation RssSourceEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.presenter fetchRssSourceModel];
}


#pragma mark - RssSourceEditViewProtocol

- (void) configureForNewMode {

}

- (void) configureForEditModeWith:(RssSourceModel *)rssSourceModel {

}


#pragma mark - UI Actions

- (IBAction)saveButtonDidTap:(id)sender {

}

@end
