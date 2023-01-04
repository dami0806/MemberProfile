//
//  MemberListManager.swift
//  MemberProfile
//
//  Created by 박다미 on 2023/01/01.
//

import Foundation

final class MemberListManager {
    //1 멤버리스트를 저장하기 위한 배열
    private var membersList:[Member] = []
    //2 전체 멤버 리스트 만들기 (원래 배열에 멤버 생성해도 됨)
    func makeMembersListDatas() {
        membersList = [
            Member(name: "닉", age: 20, phone: "010-1111-2222", address: "인천"),
            Member(name: "라바", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "매트", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "밥", age: 30, phone: "010-7777-7777", address: "캘리포니아"),
            Member(name: "보", age: 50, phone: "010-2222-7777", address: "하와이"),
            Member(name: "설리반", age: 40, phone: "010-3333-1234", address: "경주"),
            Member(name: "스폰지밥", age: 40, phone: "010-4321-1234", address: "수족관"),
            Member(name: "제리", age: 20, phone: "010-1212-1112", address: "쥐구멍"),
            Member(name: "토토로", age: 23, phone: "010-1233-3223", address: "시흥"),
            Member(name: "포뇨", age: 50, phone: "010-3569-1234", address: "전주"),
            Member(name: "핑구", age: 50, phone: "010-4321-1234", address: "남극")
        ]
    }
    
    // 전체 멤버 리스트 얻기
    func getMemberList() -> [Member]{
        return membersList
    }
    
    // 새로운 멤버 만들기
    func makeNewMember(_ member: Member) {
        membersList.append(member)
    }
    
    
    // 기존 멤버의 정보 업데이트
    func updateMemberInfo(index: Int, _ member: Member){
        membersList[index] = member
    }
    
    
    // 특정 멤버 얻기 (굳이 필요 없지만, 서브스크립트 구현해보기)
    subscript(index: Int) -> Member {
        get {
             return membersList[index]
        }
    }
}
