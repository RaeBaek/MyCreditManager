//
//  DeleteStudent.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class DeleteStudent {
    //학생삭제 함수
    func deleteStudent() {
        var name = info.name
        var students = info.students
        var gradeDictionary = info.gradeDictionary
        
        name = readLine() ?? ""
        
        if name == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else if students.contains(name) {
            print("\(name) 학생을 삭제하였습니다.")
            if let index = students.firstIndex(of: "\(name)") {
                students.remove(at: index)
            }
            while (gradeDictionary.firstIndex(where: { $0.key.hasPrefix(name) }) != nil) {
                //학생을 삭제했을 때 해당 학생의 성적도 같이 사라지게 코드 추가할 것
                if let index2 = gradeDictionary.firstIndex(where: { $0.key.hasPrefix(name) }) {
                    gradeDictionary.remove(at: index2)
                }
            }
        } else {
            print("\(name) 학생을 핮지 못했습니다.")
        }
    }
}
