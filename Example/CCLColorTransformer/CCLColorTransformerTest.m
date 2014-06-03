//
//  CCLColorTransformerTest.m
//  CCLColorTransformer
//
//  Created by Kyle Fuller on 02/06/2014.
//
//

#import <XCTest/XCTest.h>
#import <CCLColorTransformer/CCLColorTransformer.h>

@interface CCLColorTransformerTest : XCTestCase

@end

@implementation CCLColorTransformerTest

- (void)testColorTransformer {
    NSColor *color = [NSColor colorWithCalibratedRed:0.949 green:0.086 blue:0.114 alpha:1];

    // Transform
    NSValueTransformer *transformer = [[CCLColorTransformer alloc] init];
    NSData *transformedData = [transformer transformedValue:color];

    // Untransform
    NSColor *transformedColor = [transformer reverseTransformedValue:transformedData];

    XCTAssertEqual([transformedColor redComponent], 0.949);
    XCTAssertEqual([transformedColor greenComponent], 0.086);
    XCTAssertEqual([transformedColor blueComponent], 0.114);
    XCTAssertEqual([transformedColor alphaComponent], 1);
}

@end
