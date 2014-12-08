//
//  KOKeyboardConfig.m
//  KOKeyboard
//
//  Created by Anton Smirnov on 03.11.14.
//  Copyright (c) 2014 Adam Horacek. All rights reserved.
//

#import "KOKeyboardConfig.h"

// Impl for iPad
@implementation KOKeyboardConfigIpad
{
    NSString *_keys;
}

- (instancetype) init {
    if (self = [super init]) {
        _keys = @"TTTTT()\"[]{}'<>\\/$´`~^|€£◉◉◉◉◉-+=%*!?#@&_:;,.1203467589";
    }
    return self;
}

// bar
- (int) barHeight {
    return 72;
}

- (int) barWidth {
    return 768;
}

// button
- (int) buttonHeight {
    return 60;
}

- (int) topMargin {
    return 1;
}

- (int) buttonSpacing {
    return 13;
}

- (int) buttonCount {
    return 11;
}

- (int) buttonWidth {
    return 57;
}

- (NSString*) buttonKeys: (int)buttonIndex {
    return [_keys substringWithRange:NSMakeRange(buttonIndex * 5, 5)];
}

- (int) labelWidth {
    return 12;
}

- (int) labelHeight {
    return 20;
}

- (int) leftInset {
    return 9;
}

- (int) rightInset {
    return 9;
}

- (int) topInset {
    return 3;
}

- (int) bottomInset {
    return 8;
}

@end

// Impl for iPhone
@implementation KOKeyboardConfigIphone
{
    NSString *_keys;
}

- (instancetype) init {
    if (self = [super init]) {
        _keys = @"()\"[]{}'<>◉◉◉◉◉*&#@=_:;,.DDDDD";
    }
    return self;
}

// bar
- (int) barHeight {
    return 54;
}

- (int) barWidth {
    return 636;
}

// button
- (int) buttonHeight {
    return 44;
}

- (int) leftMargin {
    return 1;
}

- (int) topMargin {
    return 1;
}

- (int) buttonSpacing {
    return 12;
}

- (int) buttonCount {
    return 6;
}

- (int) buttonWidth {
    return 94;}

- (NSString*) buttonKeys: (int)buttonIndex {
    return [_keys substringWithRange:NSMakeRange(buttonIndex * 5, 5)];
}

// ---

- (int) labelWidth {
    return 10;
}

- (int) labelHeight {
    return 20;
}

- (int) leftInset {
    return 7;
}

- (int) rightInset {
    return 7;
}

- (int) topInset {
    return 2;
}

- (int) bottomInset {
    return 3;
}

@end;
