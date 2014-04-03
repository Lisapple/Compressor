//
//  Compress.m
//  Compress
//
//  Created by Max on 25/09/2009.
//  Copyright (c) 2009 __MyCompanyName__, All Rights Reserved.
//

#import "Compress.h"


@implementation Compress
@synthesize slider, label;

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
	NSMutableArray * output = [NSMutableArray array];
	for (NSString * path in input) {
		NSData * data = [NSData dataWithContentsOfFile:path];
		NSBitmapImageRep * imageRep = [[NSBitmapImageRep alloc] initWithData:data];
		
		NSNumber * number = [NSNumber numberWithFloat:([[[self parameters] objectForKey:@"compression"] floatValue]/100)];
		
		NSDictionary * properties = [NSDictionary dictionaryWithObject:number
																forKey:NSImageCompressionFactor];
		data = [imageRep representationUsingType:NSJPEGFileType properties:properties];
		NSString * pathExtension = [path.pathExtension lowercaseString];
		if (![pathExtension isEqualToString:@"jpeg"] || ![pathExtension isEqualToString:@"jpg"]) {
			path = [[path stringByDeletingPathExtension] stringByAppendingString:@".jpg"];
		}
		[data writeToFile:path atomically:YES];
		[output addObject:path];
	}
	
	return output;
}

- (void)sliderDidChange:(id)sender
{
	[label setStringValue:[NSString stringWithFormat:@"%i%%", [sender intValue]]];
}

@end
