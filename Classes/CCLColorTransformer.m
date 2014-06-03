//
//  CCLColorTransformer.m
//  Cocode
//
//  Created by Kyle Fuller on 02/06/2014.
//
//

#import "CCLColorTransformer.h"

@implementation CCLColorTransformer

+ (Class)transformedValueClass {
    return [NSData class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (NSData *)transformedValue:(NSColor *)color {
    const CGFloat *components = CGColorGetComponents([color CGColor]);
    NSString *colorAsString = [NSString stringWithFormat:@"%f,%f,%f,%f", components[0], components[1], components[2], components[3]];
    return [colorAsString dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSColor *)reverseTransformedValue:(NSData *)value {
    NSString *colorString = [[NSString alloc] initWithData:value encoding:NSUTF8StringEncoding];
    NSArray *colorComponents = [colorString componentsSeparatedByString:@","];

#if CGFLOAT_IS_DOUBLE
    CGFloat red = [colorComponents[0] doubleValue];
    CGFloat green = [colorComponents[1] doubleValue];
    CGFloat blue = [colorComponents[2] doubleValue];
    CGFloat alpha = [colorComponents[3] doubleValue];
#else
    CGFloat red = [colorComponents[0] floatValue];
    CGFloat green = [colorComponents[1] floatValue];
    CGFloat blue = [colorComponents[2] floatValue];
    CGFloat alpha = [colorComponents[3] floatValue];
#endif

    return [NSColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
