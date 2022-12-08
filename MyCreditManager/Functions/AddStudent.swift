//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class AddStudent {
    //학생추가 함수
    func addStudent(name: String) -> Array<String> {
        var students = info.students
        if name == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else if students.contains(name) {
            print("\(name)은(는) 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            print("\(name) 학생을 추가했습니다.")
            students.append(name)
        }
        return students
    }
}
