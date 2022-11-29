//
//  main.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/11/23.
//

import Foundation

var menu: String = ""
var name: String = ""
var students: [String] = []
var gradeArray: [String] = []
var gradeDictionary: [String: Any] = [:]

//반복문 실행
while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    //메뉴선택
    menu = readLine() ?? ""
    programMenu()
    
    //메뉴가 'X'라면
    if menu == "X" {
        break
    }
}

//프로그램 메뉴 함수
func programMenu() {
    // swich 문을 사용해 각 케이스 부여
    // 'X' 문자까지 입력 받아야하기 때문에 입력받는 값을 String으로 받음
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
        averageGrades()
    case "X":
        theEnd()
        break
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

//학생추가 함수
func addStudent() {
    //학생이름 입력받기
    name = readLine() ?? ""
    
    if name == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if students.contains(name) {
        print("\(name)은(는) 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        print("\(name) 학생을 추가했습니다.")
        students.append(name)
    }
}

//학생삭제 함수
func deleteStudent() {
    name = readLine() ?? ""
    
    if name == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if students.contains(name) {
        print("\(name) 학생을 삭제하였습니다.")
        if let index = students.firstIndex(of: "\(name)") {
            students.remove(at: index)
        }
    } else {
        print("\(name) 학생을 핮지 못했습니다.")
    }
}

//성적추가 함수
func addGrade() {
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

//평점보기 함수
func averageGrades() {
    name = readLine() ?? ""
    var totalGrade: Double = 0
    var finalGrade: Double = 0
    
    //해당 학생 이름이 포함된 모든 과목을 가져온다 ex) RB Swift A+, RB C C+, RB Java D ...
    let sortedStudent = gradeDictionary.filter { $0.key.contains(name) }  //딕셔너리
    //가져온 과목의 keys 값을 배열에 담는다.
    let sortedStudentKeys = Array(sortedStudent.keys)                     // 배열
    //가져온 과목의 values 값을 배열에 담는다.
    let sortedStudentValues = Array(sortedStudent.values)                 // 배열
    //    print(filter_name) //현재 입력되어 있는 성적들이 궁금하다면 출력
    
    //해당 학생의 ex) ["RB Swift", "RB C", "RB Java"] "이름 과목" 값에서 '과목'만을 가져오기 위한 반복문 실행
    for i in 0..<sortedStudent.count {
        //시작 인덱스는 '입력받은 학생의 이름 길이' 다음 인덱스부터 시작 ex) RB Swift -> 'RB '을 지나 'S'부터 시작
        let startIndex = sortedStudentKeys[i].index(sortedStudentKeys[i].startIndex, offsetBy: name.count + 1)
        //끝 인덱스는 sortedStudentKeys[i]의 길이까지
        let endIndex = sortedStudentKeys[i].index(sortedStudentKeys[i].startIndex, offsetBy: sortedStudentKeys[i].count)
        //sortedSubject 상수에 sortedStudentKeys[i] 배열 대입
        let sortedSubject = sortedStudentKeys[i]
        //slicedSubject 상수에 sortedSubject에서 인덱스만큼 자르고 남은 '과목 값'을 대입
        let slicedSubject = sortedSubject[startIndex ..< endIndex]
        
        print("\(slicedSubject):", terminator: " ")
        print(sortedStudentValues[i])
        
        //평점계산 함수 실행
        let mark = gradeCaculator(credit: sortedStudentValues[i] as! String)      //반환값을 mark에 대입
        totalGrade += mark                                                        //그 값을 totalGrade 변수에 대입
    }
    totalGrade /= Double(sortedStudent.count)         // 모두 합쳐진 grades 값을 과목 수로 나누고
    finalGrade = round(totalGrade * 100) / 100        // 최종학점에 소수점 둘째 자리까지 표현
    print("평점 : \(finalGrade)")                      // 최종학점(평점) 출력
    totalGrade = 0                                    // 다음 학생의 평점 조회를 위해 0으로 초기화
}

//평점계산 함수 -> subGrade를 매개변수로 받으며 최종평점을 Double 값으로 return
func gradeCaculator(credit: String) -> Double {
    var totalCredit: Double = 0
    
    switch credit {
    case "A+":
        totalCredit += 4.5
    case "A":
        totalCredit += 4.0
    case "B+":
        totalCredit += 3.5
    case "B":
        totalCredit += 3.0
    case "C+":
        totalCredit += 2.5
    case "C":
        totalCredit += 2.0
    case "D+":
        totalCredit += 1.5
    case "D":
        totalCredit += 1.0
    default:
        totalCredit += 0
    }
    return totalCredit
}

//종료 함수
func theEnd() {
    print("프로그램을 종료합니다...")
}
