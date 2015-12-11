//
//  AppDelegate.m
//  NSDateWH17
//
//  Created by Nikolay Berlioz on 06.10.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //----------------------------------------------------------------------------------------------------------------
    //-------------------------------   Ученик   ---------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------

    
    NSLog(@"********************   Ученик   *************************");
    
    NSMutableArray *mArrayWithStudent = [[NSMutableArray alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    for (int i = 0; i < 30; i++)
    {
        Student *student = [[Student alloc] init];    // Создаем 30 студентов-----------------------------------------
        
        student.dateOfBirthProp = [self setDateOfBirthMethod]; // Присваеваем каждому рандомно дату рождения ---------

        [mArrayWithStudent addObject:student];   // Добавляем в массив -----------------------------------------------
    }
    
    for (Student *student in mArrayWithStudent)  // Выводим содержимое массива в консоль -----------------------------
    {
        NSLog(@"%@", [dateFormatter stringFromDate:[student dateOfBirthProp]]);
    }
  
    //----------------------------------------------------------------------------------------------------------------
    //-------------------------------   Студент   --------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------

    NSLog(@"********************   Студент   *************************");

    NSArray *sortToYearArray = [mArrayWithStudent sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[obj1 dateOfBirthProp] compare:[obj2 dateOfBirthProp]]; //сортируем массив по дате рождения ----------
    }];

    NSLog(@"********************   Sorted to data of birth   *************************");

    for (Student *student in sortToYearArray)   // Выводим содержимое отсортированного массива в консоль -------------
    {
        student.name = [self setRandomNameMethod];
        student.lastName = [self setRandomLastNameMethod];
        
        NSLog(@"%@ %@ %@", student.name, student.lastName, [dateFormatter stringFromDate:[student dateOfBirthProp]]);
    }
    
    NSLog(@"****************   Sorted name, last name, DOB   ************************");

    NSArray *sortNameLastNameAndYear =[sortToYearArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([[obj1 name] isEqualToString: [obj2 name]])
        {
            return [[obj1 lastName] compare:[obj2 lastName]]; // сортируем по свойству name
        }
        else
        {
            return [[obj1 name] compare:[obj2 name]]; // сортируем по свойству lastName
        }  }];
    
    for (Student *student in sortNameLastNameAndYear)  // Выводим содержимое отсортированного массива в консоль ------
    {
        NSLog(@"%@ %@ %@", student.name, student.lastName, [dateFormatter stringFromDate:[student dateOfBirthProp]]);
    }
    
    
    

    return YES;
}

- (NSString*) setRandomNameMethod
{
    //---------   Create two arrays with names for random assignment objects   -------------------------
    NSArray *arrayName = [[NSArray alloc] initWithObjects:@"Vasiliy", @"Fedor", @"Sergey", @"Aleksey", @"Michail", @"Nikolay", @"Evgeniy", nil];
    NSInteger index = arc4random() % [arrayName count];
    NSMutableString *string = [[NSMutableString alloc] init];
    
    switch (index)
    {
        case 0:
            string = [arrayName objectAtIndex:0];
            break;
        case 1:
            string = [arrayName objectAtIndex:1];
            break;
        case 2:
            string = [arrayName objectAtIndex:2];
            break;
        case 3:
            string = [arrayName objectAtIndex:3];
            break;
        case 4:
            string = [arrayName objectAtIndex:4];
            break;
        case 5:
            string = [arrayName objectAtIndex:5];
            break;
        case 6:
            string = [arrayName objectAtIndex:6];
            break;
            
        default:
            break;
    }
    return string;
}

- (NSString*) setRandomLastNameMethod
{
    //---------   Create two arrays with  last names for random assignment objects   -------------------------
    NSArray *arrayLastName = [[NSArray alloc] initWithObjects:@"Stoma", @"Jukov", @"Afanasyev", @"Panin", @"Skutarenko", @"Nikolaev", @"Grezdkov", nil];
    NSInteger index = arc4random() % [arrayLastName count];
    NSMutableString *string = [[NSMutableString alloc] init];
    
    switch (index)
    {
        case 0:
            string = [arrayLastName objectAtIndex:0];
            break;
        case 1:
            string = [arrayLastName objectAtIndex:1];
            break;
        case 2:
            string = [arrayLastName objectAtIndex:2];
            break;
        case 3:
            string = [arrayLastName objectAtIndex:3];
            break;
        case 4:
            string = [arrayLastName objectAtIndex:4];
            break;
        case 5:
            string = [arrayLastName objectAtIndex:5];
            break;
        case 6:
            string = [arrayLastName objectAtIndex:6];
            break;
            
        default:
            break;
    }
    return string;
}


- (NSDate*) setDateOfBirthMethod
{
    NSDate *date = [NSDate date];
    
    NSTimeInterval sixTeenYears = 504576000;                                //seconds per year
    NSTimeInterval howLongAgo = arc4random() % 1103760001 + sixTeenYears;   //random diapason ot 1965 do 1999(16 - 50 years)
    
    NSDate *dayOfBirth = [date dateByAddingTimeInterval: -howLongAgo];
    
    
    return dayOfBirth;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
