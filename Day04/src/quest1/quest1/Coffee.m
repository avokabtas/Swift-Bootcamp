//
//  Coffee.m
//  quest1
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

#import "Coffee.h"

@implementation Coffee

- (instancetype)init:(NSString *)name price:(double)price {
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }
    return self;
}

@end
