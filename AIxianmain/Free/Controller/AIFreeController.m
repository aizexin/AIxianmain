//
//  AIFreeController.m
//  AIxianmain
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFreeController.h"
#import "AIFreeAppCellView.h"
#import "AFHTTPRequestOperationManager.h"
#import "AIDefine.h"
#import "AIFreeAppCellModel.h"
@interface AIFreeController ()
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation AIFreeController

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    [self requestData];

}

#pragma mark -加载数据
-(void)requestData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:FreePath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_dataSource.count > 0) {
            [_dataSource removeAllObjects];
        }
        NSArray *applications = responseObject[@"applications"];
        for (NSDictionary *itemDict in applications) {
            AIFreeAppCellModel *model = [AIFreeAppCellModel freeAppCellModelWithDict:itemDict];
            [_dataSource addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        AILog(@"%@",error.description);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIFreeAppCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"freeAppCell"];
    if (indexPath.row % 2 == 1) {
        cell.appbgImageV.image = [UIImage imageNamed:@"cate_list_bg1"];
    }else{
        cell.appbgImageV.image = [UIImage imageNamed:@"cate_list_bg2"];
    }
    cell.data = self.dataSource[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
