// Brian Butz
// HW2
// 02/08/2010

#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSLog(@"===========");
	NSLog(@"Section One");
	NSLog(@"===========");
	
    NSString *path = @"~";
	NSString *result = [path stringByExpandingTildeInPath];	
	NSLog(@"My home folder is at %@", result);
	
	NSArray *pathComponents = [result pathComponents];
	for (NSString *component in pathComponents) {
		NSLog(component);
	}
}

void PrintProcessInfo() {
	NSLog(@"===========");
	NSLog(@"Section Two");
	NSLog(@"===========");
	
	NSLog(@"Process Name '%@' Process ID: '%d'",
		  [[NSProcessInfo processInfo] processName],
		  [[NSProcessInfo processInfo] processIdentifier]);
}

void PrintBookmarkInfo() {
	NSLog(@"=============");
	NSLog(@"Section Three");
	NSLog(@"=============");
	
	NSMutableDictionary *dict = 
	[NSMutableDictionary dictionaryWithObjectsAndKeys:
	 [NSURL URLWithString:@"http://www.stanford.edu"], @"Stanford Univeristy",
	 [NSURL URLWithString:@"http://www.apple.com"], @"Apple",
	 [NSURL URLWithString:@"http://cs193p.stanford.edu"], @"CS193P",
	 [NSURL URLWithString:@"http://itunes.stanford.edu"], @"Stanford on iTunes U",
	 [NSURL URLWithString:@"http://stanfordshop.com"], @"Stanford Mail",
	 nil];
	
	for (id key in dict) {
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: '%@' URL: '%@'", key, [dict valueForKey:key]);
		}
	}	
}

void PrintIntrospectionInfo() {
	NSLog(@"============");
	NSLog(@"Section Four");
	NSLog(@"============");
	
	NSMutableArray *array = 
	[NSMutableArray arrayWithObjects:
	 @"I AM INSTANTIATE FOR REAL",
	 [NSURL URLWithString:@"http://www.google.com"],
	 [NSDictionary dictionaryWithObjectsAndKeys: @"key", @"value", nil],
	 [NSMutableString stringWithString:@"IMMA MUTANT!"],
	 [NSArray arrayWithObjects: @"1", @"2", @"300", nil],
	 nil];
	
	for(id element in array) {
		NSLog(@"Class name: %@", [element className]);
		NSLog(@"Is Member of NSString: %@", 
			  ([element isMemberOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Is Kind of NSString: %@", 
			  ([element isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Repsonds to lowercaseString: %@", 
			  ([element respondsToSelector:@selector(lowercaseString)] ? @"YES" : @"NO"));
		if ([element respondsToSelector:@selector(lowercaseString)]) {
			NSLog(@"lowercaseString is: %@",
				  [element performSelector:@selector(lowercaseString)]);
		}
		NSLog(@"=======================");
	}	
}

void PrintPolygonInfo() {
	NSLog(@"===========");
	NSLog(@"Section Six");
	NSLog(@"===========");
	
	NSMutableArray *array = [[NSMutableArray alloc] init];
	PolygonShape *polygon1 = [[PolygonShape alloc] init];
	[polygon1 setMinimumNumberOfSides:3];
	[polygon1 setMaximumNumberOfSides:7];
	[polygon1 setNumberOfSides:4];
	
	PolygonShape *polygon2 = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	
	PolygonShape *polygon3 = [[PolygonShape alloc] init];
	
	[array addObject:polygon1];
	[array addObject:polygon2];
	[array addObject:polygon3];
	
	for (id polygon in array) {
		NSLog([polygon description]);
	}
	
	[polygon1 setNumberOfSides:2];
	[polygon1 setNumberOfSides:10];
	
	[array removeAllObjects];
	[array release];
	
	[polygon1 release];
	[polygon2 release];
	[polygon3 release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();			// Section 1
	PrintProcessInfo();			// Section 2
	PrintBookmarkInfo();		// Section 3
	PrintIntrospectionInfo();	// Section 4
	PrintPolygonInfo();			// Section 6
	
    [pool drain];
    return 0;
}
