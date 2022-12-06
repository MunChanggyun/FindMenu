//
//  ToastEnum.swift
//  FindMenu
//
//  Created by mac on 2022/11/15.
//

import Foundation
import SwiftUI

enum ToastEnum {
    case success, warning, info, error
}

extension ToastEnum {
    var themeColor: Color {
        switch self {
        case .success:
            return Color.blue
        case .warning:
            return Color.yellow
        case .info:
            return Color.white
        case .error:
            return Color.red
        }
    }
    
    func getToastIcon() -> some View {
        switch self {
        case .success:
            return Image(systemName: "s.circle").renderingMode(.template).foregroundColor(themeColor)
        case .warning:
            return Image(systemName: "exclamationmark.triangle").renderingMode(.template).foregroundColor(themeColor)
        case .info:
            return Image(systemName: "info.circle").renderingMode(.template).foregroundColor(themeColor)
        case .error:
            return Image(systemName: "x.circle").renderingMode(.template).foregroundColor(themeColor)
        }
    }
}
