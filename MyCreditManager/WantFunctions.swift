//
//  WantFunctions.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class WantFunctions {
    func wantFunctions() -> String {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
        //메뉴선택
        info.menu = readLine() ?? ""
        let menu = info.menu
        
        //메뉴가 'X'라면
        if menu == "X" {
            print("프로그램을 종료합니다.")
            return menu
            
        } else {
            programMenu.programMenu(menu: menu)
        }
        return menu
    }
}
