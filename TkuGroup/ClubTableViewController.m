//
//  ClubTableViewController.m
//  TkuGroup
//
//  Created by Shuo on 5/20/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import "ClubTableViewController.h"
#import "ClubSubTableViewController.h"

@interface ClubTableViewController ()

@end

@implementation ClubTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    myClubTypeNames = [NSArray arrayWithObjects:@"01 學藝性", @"03 體育性", @"04 康樂性",
                                                @"05 服務性", @"06 聯誼性", @"07 宗教性",
                                                @"08 音樂性", @"09 學會" , @"10 自治性組織", nil];
    
    myImages = [NSArray arrayWithObjects:@"弦樂社.png",@"金門校友會.png",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number o if(section == 0 ) {
        return myClubTypeNames.count;
}

//社團分類頁面
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ClubTableViewCell";
    ClubTableViewCell *cell = (ClubTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ClubTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.nameLabel.text = [myClubTypeNames objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showClub"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ClubSubTableViewController *destViewController =
        segue.destinationViewController;
        
        //第一層Name = 第二層title
        destViewController.clubTypeName = [myClubTypeNames objectAtIndex:indexPath.row];
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 //標題列數目
 return 1;
 }*/

/*
- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{

}
*/

/*
 .	1.1 01學藝性 負責：宜家姊
 .	1.2 03體育性 負責：力誠哥
 .	1.3 04康樂性 負責：豐齊姊
 .	1.4 05服務性 負責：美蘭姊
 .	1.5 06聯誼性 負責：意婷姊
 .	1.6 07宗教性 負責：美蘭姊
 .	1.7 08音樂性 負責：豐齊姊
 .	1.8 09學會 負責：彥君姊
 .	1.9 10自治性組織 負責：意婷姊
*/



@end
