//
//  AppDelegate.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import UIKit
import RealmSwift


var uiRealm: Realm!



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        try? uiRealm = Realm()
        
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last?.path{
            print("Documents \(url)")
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    fileprivate func migrateDatabase() {
            
            let currentAppBuildString = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
            let currentAppBuildInt = UInt64(Int(currentAppBuildString) ?? 1)
            
            var config = Realm.Configuration(
                
                schemaVersion: currentAppBuildInt,
                
                migrationBlock: { migration, oldSchemaVersion in
                    
                    if (oldSchemaVersion < currentAppBuildInt) {
                        
                        
                    }
                }
            )
            
            config.deleteRealmIfMigrationNeeded = true
            Realm.Configuration.defaultConfiguration = config
            uiRealm = try! Realm()
            
        }


}

