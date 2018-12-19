//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by MTShawn on 2018/12/19.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        regisNotication(application)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}




extension AppDelegate{
    func regisNotication(_ application: UIApplication){
        let setting = UIUserNotificationSettings.init(types: [.badge,.alert], categories: nil)
        application.registerUserNotificationSettings(setting)
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let location = UILocalNotification()
        location.fireDate = NSDate.init(timeIntervalSinceNow: 0) as Date
        location.alertTitle = "测试本地推送"
        location.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(location)
        location.timeZone = NSTimeZone.default
        
        
        completionHandler(UIBackgroundFetchResult.newData)
        
    }
    
}
