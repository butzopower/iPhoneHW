//
//  PolygonShape.m
//  WhatATool
//
//  Created by bbutz on 2/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape
@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)setMinimumNumberOfSides:(int)numSides {
	if (numSides <= 2) {
		NSLog(@"Invalid Min Sides: Must be greather than 2");
	} else {
		minimumNumberOfSides = numSides;
	}
}

- (void)setMaximumNumberOfSides:(int)numSides {
	if (numSides > 12) {
		NSLog(@"Invalid Max Sides: Must be less than or equal to 12");
	} else {
		maximumNumberOfSides = numSides;
	}
}

- (void)setNumberOfSides:(int)numSides {
	if (numSides >= minimumNumberOfSides) {
		if (numSides <= maximumNumberOfSides) {
			numberOfSides = numSides;
		} else {
			NSLog(@"Invalid number of sides: %d is greater than %d",
				  numSides, maximumNumberOfSides);	
		}
	} else {
		NSLog(@"Invalid number of sides: %d is less than %d",
			  numSides, minimumNumberOfSides);
	}
}

@end
