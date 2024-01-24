//
//  main.m
//  quest1
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

#import <Foundation/Foundation.h>
#import "Barista.h"

// Для отображения цены с одним знаком после запятой (без нуля, если дробная часть оканчивается на ноль)
NSString *formatPrice(double price) {
    NSString *priceString = [NSString stringWithFormat:@"%.2f", price];
    if ([[priceString substringFromIndex:priceString.length - 1] isEqualToString:@"0"]) {
        return [NSString stringWithFormat:@"%.1f", price];
    }
    return priceString;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Меню кофе
        Coffee *cappuccino = [[Coffee alloc] init:@"Cappuccino" price:2];
        Coffee *americano = [[Coffee alloc] init:@"Americano" price:1.5];
        Coffee *latte = [[Coffee alloc] init:@"Latte" price:2.3];
        
        NSArray *menu = @[cappuccino, americano, latte];
        
        // Выводим меню
        NSLog(@"Choose coffee in menu:");
        for (int i = 0; i < menu.count; i++) {
            Coffee *coffee = menu[i];
            if (coffee.price == (int)coffee.price) {
                // %d для целых чисел - 2$
                NSLog(@"%d. %@ %d$", i + 1, coffee.name, (int)coffee.price);
            } else {
                NSLog(@"%d. %@ %@$", i + 1, coffee.name, formatPrice(coffee.price));
            }
        }
        
        // Выбираем кофе
        int choice = 0;
        scanf("%d", &choice);
        
        // Проверка данных и готовка выбранного кофе
        if (choice > 0 && choice <= menu.count) {
            Coffee *selectedCoffee = menu[choice - 1];
            Barista *barista = [[Barista alloc] init:@"Robert" surname:@"Pattinson" employmentHistory:5];
            [barista brew:selectedCoffee];
        } else {
            NSLog(@"Try again!");
        }
        
    }
    return 0;
}
