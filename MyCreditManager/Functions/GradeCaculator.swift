//
//  gradeCaculator.swift
//  MyCreditManager
//
//  Created by 백래훈 on 2022/12/07.
//

import Foundation

class GradeCaculator {
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
}
