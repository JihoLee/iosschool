//
//  main.m
//  example
//
//  Created by LEEJIHO on 2016. 5. 19..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

const NSString *myName = @"Jyo";

const int maxValue = 30;
const int minValue = 10;

typedef NS_ENUM(NSInteger, StudentCount) {
    
    StudentCountMax = 30,
    StudentCountMin = 10
    
};

typedef NS_ENUM(NSInteger, Fruits) {
    
    FruitsApple = 100, // 100
    FruitsPear,        // 101
    FruitsPeach,       // 102
    FruitsBanana,      // 103
    FruitsOrange       // 104
    
};

typedef NS_OPTIONS(NSInteger, FruitsOption) {
    
    FruitsOptionApple  = 1 << 0, // 0000 0001
    FruitsOptionPear   = 1 << 1, // 0000 0010
    FruitsOptionPeach  = 1 << 2, // 0000 0100
    FruitsOptionBanana = 1 << 3, // 0000 1000
    FruitsOptionOrange = 1 << 4  // 0001 0000
};

void selectFruitsOptions(FruitsOption options) {
    
    if(options & FruitsOptionApple) {
        printf("사과 선택\n");
    }
    if(options & FruitsOptionPear) {
        printf("배 선택\n");
    }
    if(options & FruitsOptionPeach) {
        printf("복숭아 선택\n");
    }
    if(options & FruitsOptionBanana) {
        printf("바나나 선택\n");
    }
    if(options & FruitsOptionOrange) {
        printf("오렌지 선택\n");
    }

}

void chooseFruit(Fruits selectedFruit) {
    
    switch (selectedFruit) {
        case FruitsApple:
            printf("사과를 선택했습니다.\n");
            break;
        case FruitsPear:
            printf("배를 선택했습니다.\n");
            break;
        case FruitsPeach:
            printf("복숭아를 선택했습니다.\n");
            break;
        case FruitsBanana:
            printf("바나나를 선택했습니다.\n");
            break;
        case FruitsOrange:
            printf("오렌지를 선택했습니다.\n");
            break;
        default:
            printf("선택이 잘못되었습니다.\n");
            break;
    }
    
    
}

bool canOpenClass(int numberOfStudent) {
    
    if(numberOfStudent > StudentCountMax) {
        printf("학생이 너무 많아요. 열 수 없어요.\n");
        return false;
    }
    else if(numberOfStudent < StudentCountMin) {
        printf("학생이 너무 적어요. 열 수 없어요.\n");
        return false;
    }
    
    printf("좋아요. 개강합니다.\n");
    
    
    return true;
}

int main(int argc, const char * argv[]) {
    
//    canOpenClass(40);
//    canOpenClass(20);
//    canOpenClass(5);
//    
//    chooseFruit(FruitsPear);
//    chooseFruit(FruitsApple);
//    chooseFruit(200);
//    chooseFruit(-1);
//    chooseFruit(103);
//    chooseFruit(FruitsTag);
    
    selectFruitsOptions(FruitsOptionOrange | FruitsOptionApple | FruitsOptionBanana);
    
    return 0;
}


