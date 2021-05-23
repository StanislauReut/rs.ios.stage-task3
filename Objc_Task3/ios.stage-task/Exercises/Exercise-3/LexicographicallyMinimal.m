#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSString *stringOne = [[NSString alloc] initWithString: string1];
    NSString *stringTwo = [[NSString alloc] initWithString: string2];
    NSMutableString *compositeString = [[NSMutableString alloc] init];
    
    while ([stringOne length] && [stringTwo length]) {
        const char *first = [stringOne UTF8String];
        const char *second = [stringTwo UTF8String];
        
        if (first[0] < second[0] || first[0] == second[0]) {
            [compositeString appendString: [stringOne substringToIndex: 1]];
            stringOne = [stringOne substringFromIndex: 1];
        } else {
            [compositeString appendString: [stringTwo substringToIndex: 1]];
            stringTwo = [stringTwo substringFromIndex: 1];
        }
    }
      
    
    if ([stringOne length]) {
        [compositeString appendString: stringOne];
    } else {
        [compositeString appendString: stringTwo];
    }
    
    
    return compositeString;
}

@end
