//
//  ProgramMenu.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

var addStudent = AddStudent()
var deleteStudent = DeleteStudent()
var addGrade = AddGrade()
var deleteGrade = DeleteGrade()
var averageGrades = AverageGrade()
var theEnd = TheEnd()

class ProgramMenu {
    //프로그램 메뉴 함수
    func programMenu(menu: String) {
        // swich 문을 사용해 각 케이스 부여
        // 'X' 문자까지 입력 받아야하기 때문에 입력받는 값을 String으로 받음
        switch menu {
        case "1":
            print("추가할 학생의 이름을 입력해주세요.")
            //학생이름 입력받기
            info.name = readLine() ?? ""
            let name = info.name
            let students = addStudent.addStudent(name: name)
            info.students = students
            
        case "2":
            print("삭제할 학생의 이름을 입력해주세요")
            info.name = readLine() ?? ""
            let name = info.name
            let students = deleteStudent.deleteStudent(name: name)
            info.students = students.0
            info.gradeDictionary = students.1
            
        case "3":
            print("성적을 추가할 학생의 이름, 과목이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 석정 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            info.name = readLine() ?? ""
            let studentGrade = info.name
            let gradeDictionary = addGrade.addGrade(studentGrade: studentGrade)
            info.gradeDictionary = gradeDictionary
            
        case "4":
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            info.name = readLine() ?? ""
            let studentGrade = info.name
            let gradeDictionary = deleteGrade.deleteGrade(studentGrade: studentGrade)
            info.gradeDictionary = gradeDictionary
            
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요.")
            info.name = readLine() ?? ""
            let name = info.name
            averageGrades.averageGrades(name: name)
            
        case "X":
            theEnd.theEnd()
            break
            
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
    }
}
