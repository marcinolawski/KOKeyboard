//
//  ExtraKeyboardRow.h
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

@protocol KOKeyboardListener

- (BOOL) willKeyboardInsert: (NSString*)text;
- (void) didKeyboardInsert: (NSString*)text;

@end

@interface KOKeyboardRow : UIInputView <UIInputViewAudioFeedback>

+ (KOKeyboardRow *)applyToTextView:(UITextView *)textView withConfig:(id<KOKeyboardConfig>)config;
- (void) setTabInsertString: (NSString*)string;

@property NSMutableArray *buttons;
@property (weak) id<KOKeyboardListener> listener;

- (void) setKeyboardAppearance: (UIKeyboardAppearance)appearance;

- (void)trackPointMovedX:(int)xdiff Y:(int)ydiff selecting:(BOOL)selecting;

- (void)trackPointStarted;

- (void)selectionComplete;
@end
