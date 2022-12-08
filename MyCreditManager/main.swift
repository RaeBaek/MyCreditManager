//
//  main.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/11/23.
//

import Foundation

var wantFunctions = WantFunctions()
var programMenu = ProgramMenu()
var info: Info = Info()

//반복문 실행
while true {
    let menu = wantFunctions.wantFunctions()
    guard menu != "X" else {
        break
    }
}
