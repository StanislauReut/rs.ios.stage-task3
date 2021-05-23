#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if ([ratingArray count] < 3) {
        return 0;
    }
    
    NSMutableArray *inputBuffer;
    NSMutableArray *outputBuffer;
    NSMutableSet *finalSet = [NSMutableSet new];
    
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        
        inputBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        outputBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        
        for (int j = i+1; j < [ratingArray count]; j++) {
            if ([inputBuffer count] > 1) {
                [inputBuffer removeLastObject];
            }
            
            if ([outputBuffer count] > 1) {
                [outputBuffer removeLastObject];
            }
            
            if ([ratingArray[j] intValue] > [[inputBuffer lastObject] intValue]) {
                [inputBuffer addObject:[ratingArray objectAtIndex:j]];
            } else if ([[ratingArray objectAtIndex:j] intValue] < [[outputBuffer lastObject] intValue]) {
                [outputBuffer addObject:[ratingArray objectAtIndex:j]];
            }
            
            for (int k = j+1; k < [ratingArray count]; k++) {
                if ([ratingArray[k] intValue] > [[inputBuffer lastObject] intValue]) {
                    [inputBuffer addObject:[ratingArray objectAtIndex:k]];
                } else if ([[ratingArray objectAtIndex:k] intValue] < [[outputBuffer lastObject] intValue]) {
                    [outputBuffer addObject:[ratingArray objectAtIndex:k]];
                }
                
                if ([inputBuffer count] > 2) {
                    [finalSet addObject: [[inputBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [inputBuffer removeLastObject];
                }
                
                if ([outputBuffer count] > 2) {
                    [finalSet addObject: [[outputBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [outputBuffer removeLastObject];
                }
                
            }
            
        }
    }
    return [finalSet count];
}

@end
