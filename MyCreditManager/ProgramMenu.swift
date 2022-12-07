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
    func programMenu() {
        // swich 문을 사용해 각 케이스 부여
        // 'X' 문자까지 입력 받아야하기 때문에 입력받는 값을 String으로 받음
        switch info.menu {
        case "1":
            print("추가할 학생의 이름을 입력해주세요.")
            addStudent.addStudent()
        case "2":
            print("삭제할 학생의 이름을 입력해주세요")
            deleteStudent.deleteStudent()
        case "3":
            print("성적을 추가할 학생의 이름, 과목이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 석정 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            addGrade.addGrade()
        case "4":
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            deleteGrade.deleteGrade()
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요.")
            averageGrades.averageGrades()
        case "X":
            theEnd.theEnd()
            break
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
    }
}
