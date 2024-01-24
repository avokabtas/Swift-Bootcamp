//
//  Coffee.h
//  quest1
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coffee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) double price;

- (instancetype)init:(NSString *)name price:(double)price;

@end

NS_ASSUME_NONNULL_END
