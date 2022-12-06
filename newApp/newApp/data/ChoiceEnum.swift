//
//  EnumSet.swift
//  FindMenu
//
//  Created by mac on 2022/11/10.
//

import Foundation

enum ChoiceEnum {
    case korea ,japen ,westen ,china ,rice ,bread ,soup ,meat ,chicken ,tteok ,burger ,chili ,oily ,hot ,cold ,honey ,salt
    
    var getName: String {
        switch self {
            case .korea:
                return "korea"
            case .japen:
                return "japen"
            case .westen:
                return "westen"
            case .china:
                return "china"
            case .rice:
                return "rice"
            case .bread:
                return "bread"
            case .soup:
                return "soup"
            case .meat:
                return "meat"
            case .chicken:
                return "chicken"
            case .tteok:
                return "tteok"
            case .burger:
                return "burger"
            case .chili:
                return "chili"
            case .oily:
                return "oily"
            case .hot:
                return "hot"
            case .cold:
                return "cold"
            case .honey:
                return "honey"
            case .salt:
                return "salt"
        }
    }
    
    var getKoreaName: String {
        switch self {
            
        case .korea:
            return "한식"
        case .japen:
            return "일식"
        case .westen:
            return "양식"
        case .china:
            return "중식"
        case .rice:
            return "밥"
        case .bread:
            return "빵"
        case .soup:
            return "국 및 찌개"
        case .meat:
            return "고기"
        case .chicken:
            return "치킨"
        case .tteok:
            return "분식"
        case .burger:
            return "패스트부드"
        case .chili:
            return "매운맛"
        case .oily:
            return "기름진맛"
        case .hot:
            return "뜨거운"
        case .cold:
            return "차가운"
        case .honey:
            return "달달"
        case .salt:
            return "단짠단짜"
        }
    }
}
