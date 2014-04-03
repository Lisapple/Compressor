//
//  Compress.h
//  Compress
//
//  Created by Max on 25/09/2009.
//  Copyright (c) 2009 __MyCompanyName__, All Rights Reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface Compress : AMBundleAction 
{
	NSSlider * slider;
	NSTextField * label;
}

@property (assign) IBOutlet NSSlider * slider;
@property (assign) IBOutlet NSTextField * label;

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;
- (void)sliderDidChange:(id)sender;


@end
