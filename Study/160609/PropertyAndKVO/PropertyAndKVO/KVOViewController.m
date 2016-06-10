//
//  KVOViewController.m
//  PropertyAndKVO
//
//  Created by LEEJIHO on 2016. 6. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()

@property (nonatomic, strong) IBOutlet UILabel *countLabel;

@end

@implementation KVOViewController

- (IBAction)clickButton:(id)sender {
    // @property로 선언된 변수인 count값이 증가하면 자동으로 set메소드가 호출되면서 값을 갱신함
    self.count ++;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 자기자신한테 있는 count라는 프로퍼티가 변환가 생기는지를 계속 주시
    [self addObserver:self
           forKeyPath:@"count"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld //새로운 값과 기존 값을 함께 알고 싶을 때
              context:nil];
    // Do any additional setup after loading the view.
}

// 주시하고 있다가 변경이 되면 호출
// change : 기존값(old)과 새로운값(new)을 확인할 수 있음
// change - kind값은 어떤 작업이 수행됐는지에 대한 값이 들어옴
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    
    // 데이터가 숫자이지만 NSDictionary에 저장될 때는 참조형으로 저장되기 때문에 NSNumber 타입으로 저장
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"kind : %@, new : %@", kindValue, newValue);
    
    [self.countLabel setText:[NSString stringWithFormat:@"%@", newValue]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
