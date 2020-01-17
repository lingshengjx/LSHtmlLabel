//
//  LSHtmlLabel.m
//  TestIWant
//
//  Created by lshd on 2020/1/13.
//  Copyright © 2020 lshd. All rights reserved.
//

#import "LSHtmlLabel.h"

@interface LSHtmlLabel ()
@property (nonatomic,strong)NSTextStorage *textStorage;
@property (nonatomic,strong)NSLayoutManager *layoutManager;
@property (nonatomic,strong)NSTextContainer *textContainer;
@end

@implementation LSHtmlLabel
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled=YES;
        self.numberOfLines=0;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
        self.textStorage = [NSTextStorage new];
        self.layoutManager = [NSLayoutManager new];
        self.textContainer = [NSTextContainer new];
        [self.textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager addTextContainer:self.textContainer];


    }
    return self;
}
//xib初始化
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //初始化子类
//        NSLog(@"%s",__func__);
        self.userInteractionEnabled=YES;
        self.numberOfLines=0;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];

        self.textStorage = [NSTextStorage new];
        self.layoutManager = [NSLayoutManager new];
        self.textContainer = [NSTextContainer new];
        [self.textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager addTextContainer:self.textContainer];
    }
    return self;
}

-(void)tapClick:(UITapGestureRecognizer * )gesture
{
    CGPoint location=[gesture locationInView:self];
    self.textContainer.size = self.bounds.size;
    self.textContainer.lineFragmentPadding = 0;
    self.textContainer.maximumNumberOfLines = self.numberOfLines;
    self.textContainer.lineBreakMode = self.lineBreakMode;
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange textRange = NSMakeRange(0, attributedText.length);
    [attributedText addAttribute:NSFontAttributeName value:self.font range:textRange];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = self.textAlignment;
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:textRange];
    [self.textStorage setAttributedString:attributedText];
       
        
    CGSize textSize = [self.layoutManager usedRectForTextContainer:self.textContainer].size;
        //    location.x -= (CGRectGetWidth(self.label.frame) - textSize.width) / 2;
        location.y -= (CGRectGetHeight(self.frame) - textSize.height) / 2;
        
    NSUInteger glyphIndex = [self.layoutManager glyphIndexForPoint:location inTextContainer:self.textContainer];
    CGFloat fontPointSize = self.font.pointSize;
    [self.layoutManager setAttachmentSize:CGSizeMake(fontPointSize, fontPointSize) forGlyphRange:NSMakeRange(self.text.length - 1, 1)];
    NSAttributedString *attributedSubstring = [self.attributedText attributedSubstringFromRange:NSMakeRange(glyphIndex, 1)];
    CGRect glyphRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(glyphIndex, 1)
                                                                    inTextContainer:self.textContainer];
    if (!CGRectContainsPoint(glyphRect, location)) {
        if (CGRectContainsPoint(CGRectMake(0, 0, textSize.width, textSize.height), location)) {
    //            NSLog(@"in");
        }
//            selectedBlock(-1,nil);
        NSLog(@"没找到呢,该怎么办才好呢");
        return;
    }
//        selectedBlock(glyphIndex,attributedSubstring);
//    NSLog(@"下标跟字符串都有呢%lu----%@",(unsigned long)glyphIndex,attributedSubstring);
    
    _clickLabelBlock(self,(unsigned long)glyphIndex,attributedSubstring);
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
