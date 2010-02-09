//
//  PolygonShape.h
//  WhatATool
//
//  Created by bbutz on 2/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
	float angleInDegrees;
	float angleInRadians;
	NSString *name;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

@end
