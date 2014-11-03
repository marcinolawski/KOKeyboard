//
//  SwipeButton.h
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

#import <UIKit/UIKit.h>
#import "KOKeyboardConfig.h"

@interface KOSwipeButton : UIButton

- (id)initWithFrame:(CGRect)frame andConfig: (id<KOKeyboardConfig>)config;

@property(nonatomic, weak) id delegate;
@property(nonatomic, retain) NSMutableArray *labels;
@property(nonatomic, assign) CGPoint touchBeginPoint;
@property(nonatomic, retain) UILabel *selectedLabel;
@property(nonatomic, retain) UIImageView *bgView;
@property(nonatomic, retain) UIImageView *foregroundView;
@property(nonatomic, assign) BOOL trackPoint;
@property(nonatomic, assign) BOOL tabButton;
@property(nonatomic, retain) NSDate *firstTapDate;
@property(nonatomic, assign) BOOL selecting;
@property(nonatomic, retain) UIImage *blueImage;
@property(nonatomic, retain) UIImage *pressedImage;
@property(nonatomic, retain) UIImage *blueFgImage;
@property(nonatomic, retain) UIImage *pressedFgImage;
@property(nonatomic, retain) NSString *tabString;

- (void)setKeys:(NSString *)newKeys;

@end
