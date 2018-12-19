//
//  String+Extension.swift
//  extension
//
//  Created by MTShawn on 2018/12/18.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit


extension String{
    subscript(start : Int, length : Int) -> String{
        get{
            if start < self.count && (length + start) < self.count{
                let index = self.index(self.startIndex, offsetBy: start)
                let index2 = self.index(index, offsetBy: length)
                return String(self[index ..< index2])
            }
            return ""
        }
        set{
            let tmp = self
            var s = ""
            var e = ""
            if start < self.count && (length + start) < tmp.count{
                for (idx,item) in self.enumerated(){
                    if idx < start {
                        s += "\(item)"
                    }
                    if idx > (start + length){
                        e += "\(item)"
                    }
                    print("idx==\(idx) item==\(item)")
                }
                self = s + newValue + e
            }
        }
    }
    subscript(index : Int) -> String {
        get{
            if index < self.count {
                return self[index,1]
            }
            return ""
        }
        set{
            if index < self.count{
                self[index,1] = newValue
            }
        }
    }
    
}

/// MD5加密
extension String{
    var md5 : String{
        let str = self.cString(using: .utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: .utf8))
        let disgenLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: disgenLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i  in 0 ..< disgenLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count: disgenLen)
        return String(format: hash as String)
    }
}
