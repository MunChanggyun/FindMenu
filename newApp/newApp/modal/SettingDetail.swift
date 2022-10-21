//
//  SettingDetail.swift
//  FindMenu
//
//  Created by mac on 2022/10/18.
//

import SwiftUI

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

struct SettingDetail: View {
    @State var selectList: [String] = []
    
    func putSelectedItem(_ selectedName: String) {
        if selectList.contains(selectedName) {
            selectList.remove(at: selectList.firstIndex(of: selectedName)!)
        } else {
            selectList.append(selectedName)
        }
        
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack{
                HStack {
                    Text("종류")
                        .padding(10)
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
                HStack {
                    CustomImageButton(ChoiceEnum.korea.getName, action: {
                        putSelectedItem(ChoiceEnum.korea.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.japen.getName, action: {
                        putSelectedItem(ChoiceEnum.japen.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.westen.getName, action: {
                        putSelectedItem(ChoiceEnum.westen.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.china.getName, action: {
                        putSelectedItem(ChoiceEnum.china.getKoreaName)
                    })
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                .padding(.bottom, 10)
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10, x: 5, y: 5)
            
            VStack{
                HStack {
                    Text("음식")
                        .padding(10)
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        CustomImageButton(ChoiceEnum.rice.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.rice.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.bread.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.rice.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.soup.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.soup.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.meat.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.meat.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.chicken.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.chicken.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.tteok.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.tteok.getKoreaName)
                        })
                        CustomImageButton(ChoiceEnum.burger.getName, size: 40, action: {
                            putSelectedItem(ChoiceEnum.burger.getKoreaName)
                        })
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                    .padding(10)
                }
                
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10, x: 5, y: 5)
            
            VStack{
                HStack {
                    Text("맛")
                        .padding(10)
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
                HStack {
                    CustomImageButton(ChoiceEnum.chili.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.chili.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.oily.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.oily.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.hot.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.hot.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.cold.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.cold.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.honey.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.honey.getKoreaName)
                    })
                    CustomImageButton(ChoiceEnum.salt.getName, size: 40, action: {
                        putSelectedItem(ChoiceEnum.salt.getKoreaName)
                    })
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                .padding(.bottom, 10)
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10, x: 5, y: 5)
            Spacer()
            ScrollView(.horizontal) {
                HStack {
                    Spacer()
                    ForEach(selectList, id: \.self) { item in
                        Text(item)
                        
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
                .background(Color.red)
            }
            Spacer()
        }.padding(15)
    }
}

struct SettingDetail_Previews: PreviewProvider {
    static var previews: some View {
        SettingDetail()
    }
}
