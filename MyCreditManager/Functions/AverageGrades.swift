//
//  AverageGrades.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

var gradeCaculator = GradeCaculator()

class AverageGrade {
    //평점보기 함수
    func averageGrades(name: String) {
        let students = info.students
        let gradeDictionary = info.gradeDictionary
        
        var totalGrade: Double = 0
        var finalGrade: Double = 0
        
        if !students.contains(name) {
            print("\(name) 학생을 찾지 못했습니다.")
        } else {
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
                let mark = gradeCaculator.gradeCaculator(credit: sortedStudentValues[i] as! String)      //반환값을 mark에 대입
                totalGrade += mark                                                        //그 값을 totalGrade 변수에 대입
            }
            totalGrade /= Double(sortedStudent.count)         // 모두 합쳐진 grades 값을 과목 수로 나누고
            finalGrade = round(totalGrade * 100) / 100        // 최종학점에 소수점 둘째 자리까지 표현
            print("평점 : \(finalGrade)")                      // 최종학점(평점) 출력
            totalGrade = 0                                    // 다음 학생의 평점 조회를 위해 0으로 초기화
        }
    }
}
