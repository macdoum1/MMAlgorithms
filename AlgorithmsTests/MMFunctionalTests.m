//
//  MMFunctionalTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMFunctional.h"

@interface MMFunctionalTests : XCTestCase

@end

@implementation MMFunctionalTests

#pragma mark - Flatten Array
- (void)testSingleDimensionalArray {
    NSArray *array = @[@1, @2, @3];
    NSArray *flattenedArray = [array flattenArray];
    XCTAssertEqualObjects(flattenedArray, array);
}

- (void)testTwoDimensionalArray {
    NSArray *array = @[@[@1], @[@2], @[@3]];
    NSArray *flattenedArray = [array flattenArray];
    NSArray *targetArray = @[@1, @2, @3];
    XCTAssertEqualObjects(flattenedArray, targetArray);
}

- (void)testMixedArray {
    NSArray *array = @[@1, @[@2], @[@[@3]]];
    NSArray *flattenedArray = [array flattenArray];
    NSArray *targetArray = @[@1, @2, @3];
    XCTAssertEqualObjects(flattenedArray, targetArray);
}

#pragma mark - Mapping
- (void)testAdditionMappingFunction {
    NSArray *array = @[@1, @2, @3];
    MMFunctionalMapBlock additionMappingFunction = ^NSNumber *(NSNumber *num) {
        return [NSNumber numberWithInteger:num.integerValue + 1];
    };
    
    NSArray *additionArray = [array map:additionMappingFunction];
    NSArray *targetArray = @[@2, @3, @4];
    XCTAssertEqualObjects(additionArray, targetArray);
}

- (void)testMappingWithNilReturns {
    NSArray *array = @[@1, @2, @3];
    MMFunctionalMapBlock nilMappingFunction = ^NSNumber *(NSNumber *num) {
        return nil;
    };
    
    NSArray *emptyArray = [array map:nilMappingFunction];
    XCTAssert(emptyArray.count == 0);
}

#pragma mark - Removing Duplicates
- (void)testRemoveDuplicates {
    NSArray *array = @[@1, @1, @2, @3, @4, @5, @5, @4, @6, @8];
    NSArray *dupesRemoved = [array arrayByRemovingDuplicates];
    NSArray *targetArray = @[@1, @2, @3, @4, @5, @6, @8];
    XCTAssertEqualObjects(dupesRemoved, targetArray);
}

#pragma mark - Checking for duplicates
- (void)testHasDuplicates {
    NSArray *array = @[@1, @2, @3, @4, @3, @5];
    XCTAssert([array hasDuplicates]);
}

- (void)testNoDuplicates {
    NSArray *array = @[@1, @2, @3, @4];
    XCTAssert(![array hasDuplicates]);
}

@end
