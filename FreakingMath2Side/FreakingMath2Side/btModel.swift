//
//  btModel.swift
//  FreakingMath2Side
//
//  Created by Anh Tuan on 6/12/16.
//  Copyright © 2016 Anh Tuan. All rights reserved.
//

import UIKit

class btModel: NSObject {
    var first : Int
    var second : Int
    var result : Int?
    var isTrue : Bool
    
    init(first : Int, second : Int , isTrue : Bool) {
        self.first = first
        self.second = second
        self.isTrue = isTrue
        
        //make true of false
        var tmpResult = first + second
        if isTrue == true {
            self.result = tmpResult
        }
        else {
            while true {
                tmpResult = first + second - Int(arc4random_uniform(5)) + 2
                if (tmpResult > 0) && (tmpResult != first + second) {
                    self.result = tmpResult
                    break
                }
                
            }
        }
    }
    
    func toString() ->String {
        return String(format: "%d + %d = %d", self.first, self.second, self.result!)
    }
}
