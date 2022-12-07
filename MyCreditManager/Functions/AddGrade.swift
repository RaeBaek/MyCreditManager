//
//  addGrade.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class AddGrade {
    //성적추가 함수
    func addGrade() {
        var name = info.name
        var students = info.students
        var gradeArray = info.gradeArray
        var gradeDictionary = info.gradeDictionary
        
        //학생의 이름, 과목, 성적 입력받기
        name = readLine() ?? ""
        //이름, 과목, 성적을 공백(띄어쓰기) 기준으로 배열에 담기
        gradeArray = name.components(separatedBy: " ")
        
        //배열의 길이가 1보다 커야함 (길이가 1보다 작거나 같으면 공백이거나 이름만 받은 것 (오류발생))
        if gradeArray.count > 1 {
            //배열의 길이가 2보다 커야함 (길이가 2보다 작거나 같으면 이름이거나 이름, 과목까지 받은 것 (오류발생))
            if gradeArray.count > 2 {
                //배열의 길이가 3이라면 (이름, 과목, 성적 모두 받은 것 (성공))
                if gradeArray.count == 3 {
                    //배열의 길이가 3이지만 존재하지 않는 학생이라면
                    if !students.contains(gradeArray[0]) { print("\(gradeArray[0]) 학생은 존재하지 않으므로 성적을 추가할 수 없습니다.") }
                    //존재하는 학생이라면 성공
                    else {
                        print("\(gradeArray[0]) 학생의 \(gradeArray[1]) 과목이 \(gradeArray[2])로 추가(변경) 되었습니다.")
                        gradeDictionary[gradeArray[0] + " " + gradeArray[1]] = gradeArray[2]  //성적 딕셔너리에 ["학생 과목": "성적"] 순으로 추가해준다.
    //                    print(gradeDictionary)                                              //성적 딕셔너리를 확인해보고 싶다면 출력
                        gradeArray = []                                                       //성적 배열은 다시 빈 배열로 초기화
                    }
                } else { print("입력이 잘못되었습니다. 다시 확인해주세요.") }
            } else { print("입력이 잘못되었습니다. 다시 확인해주세요.") }
        } else { print("입력이 잘못되었습니다. 다시 확인해주세요.") }
    }
}
