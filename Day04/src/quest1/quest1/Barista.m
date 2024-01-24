//
//  Barista.m
//  quest1
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

#import "Barista.h"

@implementation Barista

- (instancetype)init:(NSString *)name surname:(NSString *)surname employmentHistory:(int)employmentHistory {
    self = [super init];
    if (self) {
        _name = name;
        _surname = surname;
        _employmentHistory = employmentHistory;
    }
    return self;
}

- (void)brew:(Coffee *)coffee {
    NSLog(@"Processing brewing coffee...");
    NSLog(@"Your %@ is ready!", coffee.name);
}

@end
