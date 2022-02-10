//
//  Asset.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/09.
//

import Foundation

// 관찰할 수 있는
//MARK: ObservableObject 프로토콜을 따르는 클래스의 인스턴스를 관찰하고 있다가 값이 변경 되면 뷰를 업데이트함.
class Asset: Identifiable, Decodable, ObservableObject {
    let id: Int
    let type: AssetMenu
    let data: [AssetData]
    
    init(id: Int, type: AssetMenu, data: [AssetData]) {
        self.id = id
        self.type = type
        self.data = data
    }
}

class AssetData: Identifiable, Decodable, ObservableObject {
    let id: Int
    let title: String
    let amount: String
    let creditCardAmounts: [CreditCardAmounts]?
    
    init(id: Int, title: String, amount: String, creditCardAmounts: [CreditCardAmounts]? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.creditCardAmounts = creditCardAmounts
    }
}

enum CreditCardAmounts: Identifiable, Decodable {
        
    // 연관값을 가지는 열거형 선언 방법
    case previousMonth(amount: String)
    case currentMonth(amount: String)
    case nextMonth(amount: String)
    
    var id: Int {
        switch self {
        case .previousMonth:
            return 0
        case .currentMonth:
            return 1
        case .nextMonth:
            return 2
        }
    }
    
    var amount: String {
        switch self {
        case .previousMonth(let amount), // 블록 내부에서 값을 사용할 때는 상수나 변수로 바인딩이 가능
             .currentMonth(let amount),
             .nextMonth(let amount):
            return amount
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case previousMonth
        case currentMonth
        case nextMonth
    }
    
    // CreditCardAmounts 열거형에 값을 초기화
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        //MARK: forKey 값과 같은 key를 찾아서 디코딩한 값으로 초기화 한다.
        if let value = try? values.decode(String.self, forKey: .previousMonth) {
            self = .previousMonth(amount: value)
            return
        }

        if let value = try? values.decode(String.self, forKey: .currentMonth) {
            self = .currentMonth(amount: value)
            return
        }

        if let value = try? values.decode(String.self, forKey: .nextMonth) {
            self = .nextMonth(amount: value)
            return
        }

        throw fatalError("ERROR: Card AMounts Decoding Error")
    }
}
