//
//  NSObject+WYBExtension.m
//  
//
//  Created by 久远的回忆 on 16/1/7.
//
//

#import "NSObject+WYBExtension.h"

@implementation NSObject (WYBExtension)

//NUll处理;
- (id)checkTheDic
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary * myDic = [[NSMutableDictionary alloc]initWithDictionary:(NSDictionary *)self];
        NSArray * array = myDic.allKeys;
        for (int i = 0; i < array.count; i++) {
            id Object = myDic[array[i]];
            [myDic setObject:[Object checkTheDic] forKey:array[i]];
        }
        return myDic;
    } else if ([self isKindOfClass:[NSArray class]]){
        NSArray * array = (NSArray *)self;
        NSMutableArray * muArray = [[NSMutableArray alloc]initWithCapacity:100];
        for (int i = 0;i < array.count ; i++) {
            [muArray addObject:[array[i] checkTheDic]];
        }
        return muArray;
        
    } else if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    } else {
        return self;
    }
}


- (instancetype)noNullStr
{
   return @"";
    
}


@end
