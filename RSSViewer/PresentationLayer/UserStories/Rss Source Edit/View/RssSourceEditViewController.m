//
//  RssSourceEditViewController.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSourceEditViewController.h"
#import "MBProgressHUD.h"
#import "TextInputView.h"
#import "RssSourceModel.h"

@interface RssSourceEditViewController()
@property (weak, nonatomic) IBOutlet TextInputView *urlInputView;
@property (nonatomic, strong) MBProgressHUD *progressHud;

@end

@implementation RssSourceEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.presenter fetchRssSourceModel];
}


#pragma mark - RssSourceEditViewProtocol

- (void) configureForNewMode {
    self.title = @"Новая подписка";
}

- (void) configureForEditModeWith:(RssSourceModel *)rssSourceModel {
    self.title = rssSourceModel.name;
    self.urlInputView.text = rssSourceModel.url;
}

- (void) startSavingLoader {
    self.progressHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void) stopSavingLoaderSuccessfully {
    [self.progressHud hideAnimated:YES];
    self.progressHud = nil;
}

- (void) stopSavingLoaderWithError:(NSString *)error {
    self.progressHud.mode = MBProgressHUDModeAnnularDeterminate;
    self.progressHud.label.text = error;

    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.progressHud hideAnimated:YES];
    });
}




#pragma mark - UI Actions

- (IBAction)saveButtonDidTap:(id)sender {
    [self.presenter saveRssWithUrl:self.urlInputView.text];
}

@end
