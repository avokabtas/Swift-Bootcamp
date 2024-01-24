//
//  Barista.h
//  quest1
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Barista : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic) int employmentHistory;

- (instancetype)init:(NSString *)name surname:(NSString *)surname employmentHistory:(int)employmentHistory;
- (void)brew:(Coffee *) coffee;

@end

NS_ASSUME_NONNULL_END
