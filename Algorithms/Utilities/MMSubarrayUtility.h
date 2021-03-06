//
//  MMSubarrayUtility.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSubarrayUtility : NSObject
+ (NSArray <NSNumber *> *)subArrayOfArray:(NSArray <NSNumber *> *)array
                                  withSum:(NSNumber *)number;
+ (NSInteger)lengthOfLongestIncreasingSubarray:(NSArray *)array;
+ (NSArray *)longestIncreasingSubarray:(NSArray *)array;
+ (NSArray <NSNumber *> *)findThreeElementsInArray:(NSArray <NSNumber *> *)array
                                    whoseSumEquals:(NSInteger)sum;
+ (NSArray <NSNumber *> *)subarrayIndiciesWithLeastAverage:(NSArray <NSNumber *> *)array size:(NSInteger)size;
+ (NSArray <NSNumber *> *)tripletsFromArray:(NSArray <NSNumber *> *)array whoseSumIsLessThan:(NSInteger)lessThan;

// WIP use dictionary is WIP
+ (NSArray <NSArray *> *)allPairsFromArray:(NSArray <NSNumber *> *)array whoseSumEquals:(NSInteger)sum useDictionary:(BOOL)useDictionary;

@end
