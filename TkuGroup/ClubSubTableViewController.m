//
//  ClubSubTableViewController.m
//  TkuGroup
//
//  Created by Shuo on 8/15/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import "ClubSubTableViewController.h"

@interface ClubSubTableViewController ()

@end

@implementation ClubSubTableViewController

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
    
    self.navigationItem.title = self.clubTypeName;
    
    myClub01 = [NSArray arrayWithObjects:@"國防研究社",@"天文社", nil];
    myClub03 = [NSArray arrayWithObjects:@"溜冰社",@"桌球社", nil];
    myClub04 = [NSArray arrayWithObjects:@"舞蹈研習社", nil];
    
    myImages = [NSArray arrayWithObjects:
                @"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number o if(section == 0 ) {
    if ([self.navigationItem.title isEqual:@"01 學藝性"]) {
        return myClub01.count;
    }
    else if ([self.navigationItem.title isEqual:@"03 體育性"]) {
        return myClub03.count;
    }
    else if ([self.navigationItem.title isEqual:@"04 康樂性"]) {
        return myClub04.count;
    }
    else if ([self.navigationItem.title isEqual:@"05 服務性"]) {
        return myClub05.count;
    }
    else if ([self.navigationItem.title isEqual:@"06 聯誼性"]) {
        return myClub06.count;
    }
    else if ([self.navigationItem.title isEqual:@"07 宗教性"]) {
        return myClub07.count;
    }
    else if ([self.navigationItem.title isEqual:@"08 音樂性"]) {
        return myClub08.count;
    }
    else if ([self.navigationItem.title isEqual:@"09 學會"]) {
        return myClub09.count;
    }
    else {
        return myClub10.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ClubSubTableViewCell";
    ClubSubTableViewCell *cell = (ClubSubTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ClubSubTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([self.navigationItem.title isEqual:@"01 學藝性"]) {
        cell.Title.text = [myClub01 objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[myImages objectAtIndex:indexPath.row]];
    }
    else if ([self.navigationItem.title isEqual:@"03 體育性"]) {
        cell.Title.text = [myClub03 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"04 康樂性"]) {
        cell.Title.text = [myClub04 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"05 服務性"]) {
        cell.Title.text = [myClub05 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"06 聯誼性"]) {
        cell.Title.text = [myClub06 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"07 宗教性"]) {
        cell.Title.text = [myClub07 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"08 音樂性"]) {
        cell.Title.text = [myClub08 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"09 學會"]) {
        cell.Title.text = [myClub09 objectAtIndex:indexPath.row];
    }
    else if ([self.navigationItem.title isEqual:@"10 自治性組織"]) {
        cell.Title.text = [myClub10 objectAtIndex:indexPath.row];
    }

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showContent"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ClubViewController *destViewController = segue.destinationViewController;
        
        destViewController.clubImageName = [myImages objectAtIndex:indexPath.row];
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

@end
