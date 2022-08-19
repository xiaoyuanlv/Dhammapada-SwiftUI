//
//  CategoryViewModel.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/22/22.
//

import Foundation
import SwiftUI
import GRDB

final class AppDataManager: ObservableObject {
    
    @Published var isDarkModeOn =  false
    @Published var selectedLang: String = "en"
    @Published var textColor: String = "black"
    @Published var selectedCategoryId: Int = 0
    @Published var categoryList: [Category] = []
    @Published var dhammaList: [Dhamma] = []
    @Published var favList: [Dhamma] = []
    
    func getCategories() {
        categoryList = categoryDataList
    }
    
    func setLanguage(lang: String) {
        self.selectedLang = lang
    }
    
    func getDhammaList() {
        copyDatabaseIfNeeded("dhammapada2")
        populateDhammaDataList()
    }
    
    func updateDhammaBookmark(id: Int64, fav: Int) {
        do {
            
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let databaseURL = fileURL.appendingPathComponent("dhammapada2.db")
         
            let dbQueue = try DatabaseQueue(path: databaseURL.absoluteString)
       
            try dbQueue.write { db in
                if var dhamma = try Dhamma.fetchOne(db, id: id) {
                    dhamma.fav = fav
                    try dhamma.update(db)
                }
            }
           
        } catch {
            print("OOPS, some sort of failure \(error.localizedDescription)")
        }
    }
    
    func populateDhammaDataList() {

        do {
            
            dhammaList = []
            if(selectedCategoryId > 0) {
                let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let databaseURL = fileURL.appendingPathComponent("dhammapada2.db")
             
                let dbQueue = try DatabaseQueue(path: databaseURL.absoluteString)
                
//                try dbQueue.read { db in
//                    let tables = try String.fetchAll(db, sql: """
//                        SELECT name FROM sqlite_master WHERE type='table'
//                        """)
//
//                    for table in tables {
//                       print("Table : \(table)")
//                    }
//                }
           
                let res = try dbQueue.read { db in
                        try Dhamma.fetchAll(db, sql: "SELECT * FROM tbl_dhamma where category_id=\(selectedCategoryId)")
                }
                dhammaList = res
            }
        } catch {
            print("OOPS, some sort of failure \(error.localizedDescription)")
        }

    }
    
    func populateDhammaFavDataList() {

        do {
            copyDatabaseIfNeeded("dhammapada2")
            
            favList = []
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let databaseURL = fileURL.appendingPathComponent("dhammapada2.db")
         
            let dbQueue = try DatabaseQueue(path: databaseURL.absoluteString)
       
            let res = try dbQueue.read { db in
                try Dhamma.fetchAll(db, sql: "SELECT * FROM tbl_dhamma where fav=1")
            }
            favList = res
        } catch {
            print("OOPS, some sort of failure  \(error.localizedDescription)")
        }

    }
    
    
    func copyDatabaseIfNeeded(_ database: String) {

        let fileManager = FileManager.default

        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)

        guard documentsUrl.count != 0 else {
            print("No doc urls")
            return
        }
        
        // Remove old file
        let versionOneDatabaseURL = documentsUrl.first!.appendingPathComponent("dhammapada.db")
        
        if ((try? versionOneDatabaseURL.checkResourceIsReachable()) != nil) {
            do {
                try fileManager.removeItem(atPath: versionOneDatabaseURL.path)
            } catch _ as NSError {
                print("Couldn't remove v1 file")
            }
        } else {
            print("Not Found")
        }

        // Copy New File
        
        let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("\(database).db")

        if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
            print("DB does not exist in documents folder")
            

            let databaseInMainBundleURL = Bundle.main.resourceURL?.appendingPathComponent("\(database).db")

            do {
                try fileManager.copyItem(atPath: (databaseInMainBundleURL?.path)!, toPath: finalDatabaseURL.path)
                print("DB Copied")
            } catch let error as NSError {
                print("Couldn't copy file to final location! Error:\(error.description)")
            }

        } else {
            print("Database file found at path: \(finalDatabaseURL.path)")
        }
    }
    
    func changeDarkMode(state: Bool){
        isDarkModeOn = state
        if(isDarkModeOn) {
            textColor = "white"
        }else {
            textColor = "black"
        }
      (UIApplication.shared.connectedScenes.first as?
      UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ?   .dark : .light
      UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
}
