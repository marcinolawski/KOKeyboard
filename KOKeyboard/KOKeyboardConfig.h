//
//  KOKeyboardConfig.h
//  KOKeyboard
//
//  Created by Anton Smirnov on 03.11.14.
//  Copyright (c) 2014 Adam Horacek. All rights reserved.
//

#import <Foundation/Foundation.h>

// base protocol to be implemented by Configuration
@protocol KOKeyboardConfig

// bar
- (int) barHeight;
- (int) barWidth;

// button
- (int) buttonHeight;
- (int) topMargin;
- (int) buttonSpacing;
- (int) buttonCount;
- (int) buttonWidth;
- (NSString*) buttonKeys: (int)buttonIndex;

- (int) labelWidth;
- (int) labelHeight;
- (int) leftInset;
- (int) rightInset;
- (int) topInset;
- (int) bottomInset;

@end

// Impl for iPad
@interface KOKeyboardConfigIpad : NSObject <KOKeyboardConfig>
@end

// Impl for iPhone
@interface KOKeyboardConfigIphone : NSObject <KOKeyboardConfig>
@end;

