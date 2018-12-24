//
//  TextInputView.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "TextInputView.h"

@interface TextInputView()
@property (nonatomic, strong) IBOutlet UILabel * titleLabel;
@property (nonatomic, strong) IBOutlet UITextField * textField;

@end

@implementation TextInputView


#pragma mark - Accessors

- (void) setText:(NSString *)text {
    self.textField.text = text;
}

- (NSString *) text {
    return self.textField.text;
}

@end
