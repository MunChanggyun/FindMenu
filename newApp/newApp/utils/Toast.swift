//
//  Toast.swift
//  FindMenu
//
//  Created by mac on 2022/11/15.
//

import Foundation

/**
 Equatable은 프로토콜이다.

 즉, Equatable이라는 약속이 있다는 것을 의미하며, 이를 채택하면 이를 준수해야한다는 것이다.
 */
struct Toast: Equatable {
    var type: ToastEnum
    var message: String
}
