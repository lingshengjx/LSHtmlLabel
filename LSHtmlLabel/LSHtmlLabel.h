//
//  LSHtmlLabel.h
//  TestIWant
//
//  Created by lshd on 2020/1/13.
//  Copyright © 2020 lshd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LSHtmlLabel;
typedef void(^ClickLSHtmlLabelBlock)(LSHtmlLabel * label,NSUInteger index,NSAttributedString * attributedSubstring);

@interface LSHtmlLabel : UILabel
@property(nonatomic,copy)ClickLSHtmlLabelBlock clickLabelBlock;

@end

NS_ASSUME_NONNULL_END
