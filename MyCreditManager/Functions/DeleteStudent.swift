//
//  DeleteStudent.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class DeleteStudent {
    //학생삭제 함수
    func deleteStudent(name: String) -> (Array<String>, Dictionary<String, Any>) {
        var students = info.students
        var gradeDictionary = info.gradeDictionary
        
        if name == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else if students.contains(name) {
            print("\(name) 학생을 삭제하였습니다.")
            if let studentsIndex = students.firstIndex(of: "\(name)") {
                students.remove(at: studentsIndex)
            }
            // 학생을 삭제했을 때 해당 학생의 성적도 같이 삭제 (이름만 삭제하고 성적은 남아있을 경우를 만들기 않기 위해)
            // 성적이 여러개일 상황을 고려하여 반복분 실행
            while (gradeDictionary.firstIndex(where: { $0.key.hasPrefix(name) }) != nil) {
                if let gradeDictionaryIndex = gradeDictionary.firstIndex(where: { $0.key.hasPrefix(name) }) {
                    gradeDictionary.remove(at: gradeDictionaryIndex)
                }
            }
        } else {
            print("\(name) 학생을 핮지 못했습니다.")
        }
        return (students, gradeDictionary)
    }
}
