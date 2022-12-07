//
//  main.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/11/23.
//

import Foundation

var programMenu = ProgramMenu()
var info = Info()

//반복문 실행
while true {
    var menu = info.menu
    
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    //메뉴선택
    menu = readLine() ?? ""
    programMenu.programMenu()
    
    //메뉴가 'X'라면
    if menu == "X" {
        break
    }
}
