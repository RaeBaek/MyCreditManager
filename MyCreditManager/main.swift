//
//  main.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/11/23.
//

import Foundation

var menu = ""
var name = ""
var name2 = ""
var gd = ""
var hakjum: Double = 0
var avgJum: Double = 0
var count: Int = 0
var student: [String] = []
var perGrade: [String] = []
var grade: [String: Any] = [:]

struct grade1: Hashable {
    var name = ""
    var subject = ""
    var grade = ""
}

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    menu = readLine() ?? ""
    myCreditManager()
    
    if menu == "X" {
        break
    }
}

//학생 관리 함수
func myCreditManager() {
    switch menu {
    case "1":
        print("추가할 학생의 이름을 입력해주세요.")
        addStudent()
    case "2":
        print("삭제할 학생의 이름을 입력해주세요")
        deleteStudent()
    case "3":
        print("성적을 추가할 학생의 이름, 과목이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 석정 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        addGrade()
    case "4":
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        deleteGrade()
    case "5":
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        avgGrade()
    case "X":
        exit()
        break
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

//학생추가 함수
func addStudent() {
    name = readLine() ?? ""
    
    if name == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if student.contains(name) == true {
        print("\(name)은(는) 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else if student.contains(name) == false {
        print("\(name) 학생을 추가했습니다.")
        student.append(name)
    }
    
}

//학생삭제 함수
func deleteStudent() {
    name = readLine() ?? ""
    
    if name == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if student.contains(name) == true {
        print("\(name) 학생을 삭제하였습니다.")
        if let index = student.firstIndex(of: "\(name)") {
            student.remove(at: index)
        }
    } else if student.contains(name) == false {
        print("\(name) 학생을 핮지 못했습니다.")
    }
}

//성적추가 함수
func addGrade() {
    name = readLine() ?? ""
    perGrade = name.components(separatedBy: " ")
    
    if perGrade.count != 1 {
        if perGrade.count != 2 {
            if perGrade.count == 3 {
                if !student.contains(perGrade[0]) {
                    print("\(perGrade[0]) 학생은 존재하지 않으므로 성적을 추가할 수 없습니다.")
                } else {
                    print("\(perGrade[0]) 학생의 \(perGrade[1]) 과목이 \(perGrade[2])로 추가(변경) 되었습니다.")
                    grade[perGrade[0] + " " + perGrade[1]] = perGrade[2]
                    print(grade)
                    perGrade = []
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

//성적삭제 함수
func deleteGrade() {
    name = readLine() ?? ""
    perGrade = name.components(separatedBy: " ")
    
    if perGrade.count != 1 {
        if !student.contains(perGrade[0]) {
            print("\(perGrade[0]) 학생을 찾지 못했습니다.")
        } else if perGrade.count == 2 {
            print("\(perGrade[0]) 학생의 \(perGrade[1]) 과목의 성적이 삭제되었습니다.")
            grade.removeValue(forKey: perGrade[0] + " " + perGrade[1])
            print(grade)
            perGrade = []
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

//평점보기 함수
func avgGrade() {
    name = readLine() ?? ""
    
    let name2 = grade.filter { $0.key.contains(name) }  //딕셔너리
    let name3 = Array(name2.keys)   // 배열
    let name4 = Array(name2.values) // 배열
//    print(name2) //현재 입력되어 있는 성적들이 궁금하다면 출력
    
    for i in 0..<name3.count {
        let startIndex = name3[i].index(name3[i].startIndex, offsetBy: name2.count)// 사용자지정 시작인덱스
        let endIndex = name3[i].index(name3[i].startIndex, offsetBy: name3[i].count)
        let name5 = name3[i]
        let sliced_name = name5[startIndex ..< endIndex]
        
        print("\(sliced_name):", terminator: " ")
        print(name4[i])
        
        gradeCaculator(gd: name4[i] as! String, count: name3.count)
    }
    
    avgJum = hakjum / Double(name3.count)
    let str = String(format: "%.2f", avgJum)
    print("평점 : \(str)")
    
}

//종료 함수
func exit() {
    print("프로그램을 종료합니다...")
}

func gradeCaculator(gd: String, count: Int) -> Double {
    if gd == "A+" {
        hakjum += 4.5
    } else if gd == "A" {
        hakjum += 4.0
    } else if gd == "B+" {
        hakjum += 3.5
    } else if gd == "B" {
        hakjum += 3.0
    } else if gd == "C+" {
        hakjum += 2.5
    } else if gd == "C" {
        hakjum += 2.0
    } else if gd == "D+" {
        hakjum += 1.5
    } else if gd == "D" {
        hakjum += 1.0
    } else {
        hakjum += 0
    }
    
    return hakjum
}
