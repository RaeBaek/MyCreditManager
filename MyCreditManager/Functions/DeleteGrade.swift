//
//  DeleteGrade.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class DeleteGrade {
    var name = info.name
    var students = info.students
    var gradeArray = info.gradeArray
    var gradeDictionary = info.gradeDictionary
    
    //성적삭제 함수
    func deleteGrade() {
        name = readLine() ?? ""
        gradeArray = name.components(separatedBy: " ")
        
        if gradeArray.count > 1 {
            if gradeArray.count == 2 {
                if !students.contains(gradeArray[0]) {
                    print("\(gradeArray[0]) 학생을 찾지 못했습니다.")
                } else {
                    print("\(gradeArray[0]) 학생의 \(gradeArray[1]) 과목의 성적이 삭제되었습니다.")
                    gradeDictionary.removeValue(forKey: gradeArray[0] + " " + gradeArray[1])
        //            print(gradeDictionary)      //삭제가 정상적으로 되었는지 확인해보고 싶다면 출력
                    gradeArray = []               //성적 배열은 다시 빈 배열로 초기화
                }
            } else { print("입력이 잘못되었습니다. 다시 확인해주세요.") }
        } else { print("입력이 잘못되었습니다. 다시 확인해주세요.") }
    }
}
