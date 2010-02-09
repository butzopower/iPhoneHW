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

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	[self setMinimumNumberOfSides: min];
	[self setMaximumNumberOfSides: max];
	[self setNumberOfSides: sides];
	
	return self;
}

- (id)init {
	return [self initWithNumberOfSides: 5 
				  minimumNumberOfSides: 3
				  maximumNumberOfSides: 10];
}

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians {
	return ([self angleInDegrees] / M_PI);
}

- (NSString *)name {
	switch(numberOfSides) {
		case 3:
			return @"Triangle";
		case 4:
			return @"Square";
		case 5:
			return @"Pentagon";
		case 6:
			return @"Hexagon";
		case 7:
			return @"Heptagon";
		case 8:
			return @"Octagon";
		case 9:
			return @"Nonagon";
		case 10:
			return @"Decagon";
		case 11:
			return @"Hendecagon";
		case 12:
			return @"Dodecagon";
		default:
			return [NSString stringWithFormat:@"%d-agon", numberOfSides];
	}
}

- (NSString *)description {
	return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians)", 
			numberOfSides, [self name], [self angleInDegrees], [self angleInRadians]];
}

- (void)delloc {
	NSLog(@"Deallocating"); // This never gets called for some reason
	[super dealloc];
}

@end
