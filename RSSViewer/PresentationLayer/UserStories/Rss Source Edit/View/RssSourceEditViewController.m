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
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
}

- (void) stopSavingLoaderSuccessfully {
    [MBProgressHUD hideHUDForView:self.view animated:NO];

    [self.presenter goBackForNavigationController:self.navigationController];
}

- (void) stopSavingLoaderWithError:(NSString *)error {
    [MBProgressHUD hideHUDForView:self.view animated:NO];

    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = error;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    });
}




#pragma mark - UI Actions

- (IBAction)saveButtonDidTap:(id)sender {
    [self.presenter saveRssWithUrl:self.urlInputView.text];
}

@end
