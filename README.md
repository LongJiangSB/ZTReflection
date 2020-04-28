# ZTReflection
实现不定参数、不定类型的自定义反射机制

>更多内容请看：[【iOS】SDK开发之自定义反射实现不定参数、不定数据类型方法的调用](https://www.jianshu.com/p/78b96962f81e)

···

    // 不需要返回值时的调用（当然也可以调用下面的那个，返回值参数那里传NULL就是不获取返回值）
    Class class = [NSClassFromString(@"Test") class]; // 建议调一次class方法，预防NSClassFromString出来的不是真正的类对象导致的错误
    [ZTReflection performWithTarget:class selectorStringAndParameter:@"test:p1:p2:p3:p4:p5:p6:p7:p8:p9:p10:p11:p12:p13:p14:p15:", nil, @"p111", 222, 3.33f, CGSizeMake(1, 4), [NSNull null], block, YES, 'C', "C++", value, NSSelectorFromString(@"RTT"), p1, p2, [NSObject class], imp];
    
    // 一个参数
    [ZTReflection performWithTarget:class selectorStringAndParameter:@"test:", 888];
    
    // 对象调用无参数方法
    [ZTReflection performWithTarget:[class new] returnValue:NULL selectorStringAndParameter:@"test"];
    
    // 测试返回值
    __unsafe_unretained id tempStr = NULL; // 不建议用__weak，会引发控制台报错（虽然可以无视）
    [ZTReflection performWithTarget:class returnValue:&tempStr selectorStringAndParameter:@"test:p1:p2:p3:p4:p5:p6:p7:p8:p9:p10:p11:p12:p13:p14:p15:", @"带返回值的调用", @"p222", 222, 3.33f, CGSizeMake(5, 5), [NSNull null], nil, YES, 'Y', NULL, value, NSSelectorFromString(@"RTT"), p1, p2, [NSString class], imp];
    NSArray *array = (NSArray *)tempStr;
    NSLog(@"返回值 = %@", array);
    
    //返回Block
    void(^tempBlock)(void);
    [ZTReflection performWithTarget:class returnValue:&tempBlock selectorStringAndParameter:@"testReturnBlock"];
    NSLog(@"返回值 = %p", tempBlock);
    if (tempBlock)
    {
        tempBlock();
    }
    
    //返回Int
    int tempInt;
    [ZTReflection performWithTarget:class returnValue:&tempInt selectorStringAndParameter:@"testReturnInt"];
    NSLog(@"返回值 = %d", tempInt);
    
    //返回Double
    double tempDouble;
    [ZTReflection performWithTarget:class returnValue:&tempDouble selectorStringAndParameter:@"testReturnDouble"];
    NSLog(@"返回值 = %f", tempDouble);
    
    //返回Char
    char tempChar;
    [ZTReflection performWithTarget:class returnValue:&tempChar selectorStringAndParameter:@"testReturnChar"];
    NSLog(@"返回值 = %c", tempChar);
    
    //返回字符串
    char *tempString;
    [ZTReflection performWithTarget:class returnValue:&tempString selectorStringAndParameter:@"testReturnStr"];
    NSLog(@"返回值 = %s", tempString);
    
    //返回char 地址
    char **tempP;
    [ZTReflection performWithTarget:class returnValue:&tempP selectorStringAndParameter:@"testReturnP"];
    NSLog(@"返回值 = %p", tempP);
    
    //返回类
    __unsafe_unretained Class tempcClass;
    [ZTReflection performWithTarget:class returnValue:&tempcClass selectorStringAndParameter:@"testReturnClass"];
    NSLog(@"返回值 = %@", tempcClass);
    
    //返回IMP
    IMP tempIMP;
    [ZTReflection performWithTarget:class returnValue:&tempIMP selectorStringAndParameter:@"testReturnIMP"];
    NSLog(@"返回值 = %p", tempIMP);
    
    //返回事件响应
    SEL tempSEL;
    [ZTReflection performWithTarget:class returnValue:&tempSEL selectorStringAndParameter:@"testReturnSEL"];
    NSLog(@"返回值 = %@", NSStringFromSelector(tempSEL));
    
    //返回Size
    CGSize tempCGSize;
    [ZTReflection performWithTarget:class returnValue:&tempCGSize selectorStringAndParameter:@"testReturnCGSize"];
    NSLog(@"返回值 = %@", NSStringFromCGSize(tempCGSize));
    
    //返回结构体
    YY tempStruct;
    [ZTReflection performWithTarget:class returnValue:&tempStruct selectorStringAndParameter:@"testReturnStruct"];
    NSLog(@"返回值 = %d  %f  %ld", tempStruct.i, tempStruct.j, tempStruct.k);
    
···
