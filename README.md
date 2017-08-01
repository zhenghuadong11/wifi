# wifi
一个定时器wifi效果

    CGUnilimiteScrollView * scrollView = [[CGUnilimiteScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.width, 150)];
    UIImage * image1 = [UIImage imageNamed:@"1"];
    UIImage * image2 = [UIImage imageNamed:@"2"];
    UIImage * image3 = [UIImage imageNamed:@"3"];
    NSMutableArray<UIImage *> * imageArray = [NSMutableArray arrayWithObjects:image1,image2,image3, nil];
    scrollView.imageStrs = imageArray;
    [self.view addSubview:scrollView];
