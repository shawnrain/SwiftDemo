//
//  DataModel.swift
//  NSCoder
//
//  Created by MTShawn on 2018/12/19.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    var userList = [UserInfo]()
    override init(){
        super.init()
        print("====saveurl==\(dataFilePath())")
    }
    /// 保存
    func saveData(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver.init(forWritingWith: data)
        archiver.encode(userList, forKey: "userList")
        archiver.finishEncoding()
        data.write(toFile: dataFilePath(), atomically: true)
    }
    /// 读取
    func loadData(){
        let path = dataFilePath()
        let filemanager = FileManager.default
        if filemanager.fileExists(atPath: path) {
            let url = URL.init(fileURLWithPath: path)
            let data = try! Data.init(contentsOf: url)
            let unarchi = NSKeyedUnarchiver.init(forReadingWith: data)
            userList = unarchi.decodeObject(forKey: "userList") as! Array
            unarchi.finishDecoding()
        }
    }
    /// 存储地址
    func docunmentsDirector() -> String{
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = path.first!
        return documentsDir
    }
    func dataFilePath() -> String{
        return docunmentsDirector().appendingFormat("/userList.plist")
    }
    
    
}
