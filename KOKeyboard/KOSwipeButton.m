//
//  SwipeButton.m
//  KeyboardTest
//
//  Created by Kuba on 28.06.12.
//  Copyright (c) 2012 Adam Horacek, Kuba Brecka
//
//  Website: http://www.becomekodiak.com/
//  github: http://github.com/adamhoracek/KOKeyboard
//	Twitter: http://twitter.com/becomekodiak
//  Mail: adam@becomekodiak.com, kuba@becomekodiak.com
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "KOSwipeButton.h"
#import "KOKeyboardRow.h"
#import "UIImageExtensions.h"
#import "UIColorExtensions.h"

#define TIME_INTERVAL_FOR_DOUBLE_TAP 0.4

@implementation KOSwipeButton

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    self.bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.bgView setImage:[UIImage imageWithUIColor:[UIColor whiteColor]]];
    [self.bgView setHighlightedImage:[UIImage imageWithUIColor:[UIColor colorFromHexString:@"#CCCCCC"]]];
    self.bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
    [self addSubview:self.bgView];


    int labelWidth = 20;
    int labelHeight = 20;
    int leftInset = 9;
    int rightInset = 9;
    int topInset = 3;
    int bottomInset = 8;

    self.labels = [[NSMutableArray alloc] init];
    self.tabString = @"    ";

    UIFont *f = [UIFont systemFontOfSize:15];

    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(leftInset, topInset, labelWidth, labelHeight)];
    l.textAlignment = UITextAlignmentLeft;
    l.text = @"1";
    l.font = f;
    [self addSubview:l];
    [l setHighlightedTextColor:[UIColor whiteColor]];
    l.backgroundColor = [UIColor clearColor];
    [self.labels addObject:l];

    l = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - labelWidth - rightInset, topInset, labelWidth, labelHeight)];
    l.textAlignment = UITextAlignmentRight;
    l.text = @"2";
    l.font = f;
    l.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:l];
    [l setHighlightedTextColor:[UIColor whiteColor]];
    l.backgroundColor = [UIColor clearColor];
    [self.labels addObject:l];

    l = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake((self.frame.size.width - labelWidth - leftInset - rightInset) / 2 + leftInset, (self.frame.size.height - labelHeight - topInset - bottomInset) / 2 + topInset, labelWidth, labelHeight))];
    l.textAlignment = UITextAlignmentCenter;
    l.text = @"3";
    l.font = f;
    l.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:l];
    [l setHighlightedTextColor:[UIColor whiteColor]];
    l.backgroundColor = [UIColor clearColor];
    [self.labels addObject:l];

    l = [[UILabel alloc] initWithFrame:CGRectMake(leftInset, (self.frame.size.height - labelHeight - bottomInset), labelWidth, labelHeight)];
    l.textAlignment = UITextAlignmentLeft;
    l.text = @"4";
    l.font = f;
    [self addSubview:l];
    [l setHighlightedTextColor:[UIColor whiteColor]];
    l.backgroundColor = [UIColor clearColor];
    [self.labels addObject:l];

    l = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - labelWidth - rightInset, (self.frame.size.height - labelHeight - bottomInset), labelWidth, labelHeight)];
    l.textAlignment = UITextAlignmentRight;
    l.text = @"5";
    l.font = f;
    l.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:l];
    [l setHighlightedTextColor:[UIColor whiteColor]];
    l.backgroundColor = [UIColor clearColor];
    [self.labels addObject:l];

    self.firstTapDate = [[NSDate date] dateByAddingTimeInterval:-1];

    return self;
}

- (void)setKeys:(NSString *)newKeys {
    for (int i = 0; i < MIN(newKeys.length, 5); i++) {
        [[self.labels objectAtIndex:i] setText:[newKeys substringWithRange:NSMakeRange(i, 1)]];
        [[self.labels objectAtIndex:i] setAdjustsFontSizeToFitWidth:YES];

        if ([[newKeys substringToIndex:1] isEqualToString:@"◉"] |
                [[newKeys substringToIndex:1] isEqualToString:@"T"]) {

            self.trackPoint = [[newKeys substringToIndex:1] isEqualToString:@"◉"];
            self.tabButton = [[newKeys substringToIndex:1] isEqualToString:@"T"];

            if (i != 2)
                [[self.labels objectAtIndex:i] setHidden:YES];
            else {
                [[self.labels objectAtIndex:i] setFont:[UIFont systemFontOfSize:20]];
                if (self.trackPoint) {
                    self.blueImage = [UIImage imageWithUIColor:[UIColor colorFromHexString:@"#336ccc"]];
                    self.pressedImage = [UIImage imageWithUIColor:[UIColor colorFromHexString:@"#CCCCCC"]];
                    [[self.labels objectAtIndex:i] setText:@"◉"];
                    [[self.labels objectAtIndex:i] setFrame:self.bounds];

                } else {
                    [[self.labels objectAtIndex:i] setText:@"→"];
                    [[self.labels objectAtIndex:i] setFrame:self.bounds];
                }
            }
        }
    }
}

- (void)selectLabel:(int)idx {
    self.selectedLabel = nil;

    for (int i = 0; i < self.labels.count; i++) {
        UILabel *l = [self.labels objectAtIndex:i];
        l.highlighted = (idx == i);

        if (idx == i)
            self.selectedLabel = l;
    }

    self.bgView.highlighted = self.selectedLabel != nil;
    self.foregroundView.highlighted = self.selectedLabel != nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[UIDevice currentDevice] playInputClick];
    UITouch *t = [touches anyObject];
    self.touchBeginPoint = [t locationInView:self];

    if (self.trackPoint) {
        if (fabs([self.firstTapDate timeIntervalSinceNow]) < TIME_INTERVAL_FOR_DOUBLE_TAP) {
            self.bgView.highlightedImage = self.blueImage;
            self.foregroundView.highlightedImage = self.blueFgImage;
            self.selecting = YES;
        } else {
            self.bgView.highlightedImage = self.pressedImage;
            self.foregroundView.highlightedImage = self.pressedFgImage;
            self.selecting = NO;
        }
        self.firstTapDate = [NSDate date];

        [self.delegate trackPointStarted];
    }

    [self selectLabel:2];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint touchMovePoint = [t locationInView:self];

    CGFloat xdiff = self.touchBeginPoint.x - touchMovePoint.x;
    CGFloat ydiff = self.touchBeginPoint.y - touchMovePoint.y;
    CGFloat distance = sqrt(xdiff * xdiff + ydiff * ydiff);

    if (self.trackPoint) {
        [self.delegate trackPointMovedX:xdiff Y:ydiff selecting:self.selecting];
        return;
    }

    if (distance > 250) {
        [self selectLabel:-1];
    } else if (!self.tabButton && (distance > 20)) {
        CGFloat angle = atan2(xdiff, ydiff);

        if (angle >= 0 && angle < M_PI_2) {
            [self selectLabel:0];
        } else if (angle >= 0 && angle >= M_PI_2) {
            [self selectLabel:3];
        } else if (angle < 0 && angle > -M_PI_2) {
            [self selectLabel:1];
        } else if (angle < 0 && angle <= -M_PI_2) {
            [self selectLabel:4];
        }
    } else {
        [self selectLabel:2];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.selectedLabel != nil) {
        if (self.tabButton) {
            [self.delegate insertText:self.tabString];
        } else if (!self.trackPoint) {
            NSString *textToInsert = self.selectedLabel.text;
            [self.delegate insertText:textToInsert];
        } else if (self.trackPoint && self.selecting) {
            [self.delegate selectionComplete];
        }
    }

    [self selectLabel:-1];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self selectLabel:-1];
}

@end
