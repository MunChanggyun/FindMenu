//
//  SettingDetail.swift
//  FindMenu
//
//  Created by mac on 2022/10/18.
//

import SwiftUI



struct SettingDetail: View {
    @Environment(\.presentationMode) var presentation
    var categories: [ChoiceEnum] = [.korea, .japen, .westen, .china]
    var foods: [ChoiceEnum] = [.rice, .bread, .soup, .meat, .chicken, .tteok, .burger]
    var fravors: [ChoiceEnum] = [.chili, .oily, .hot, .cold, .honey, .salt]
    @Binding var selectedFavorit: [ChoiceEnum]
    
    func putSelectedItem(_ selectedName: ChoiceEnum) {
        if selectedFavorit.contains(selectedName) {
            selectedFavorit.remove(at: selectedFavorit.firstIndex(of: selectedName)!)
        } else {
            selectedFavorit.append(selectedName)
        }
        
    }
    
    var body: some View {
        Color("windowBackground").ignoresSafeArea() // 최상단, 최하단 safeArea 까지 배경을 넣기 위해 추가
            .overlay(
                VStack {
                    List{
                        Section{
                            HStack{
                                Image("choice")
                                    .resizable()
                                    .frame(width: 40.0, height: 40.0)
                                Text("땡기는걸 골라봐")
                                    .font(Font.system(size: 20.0, weight: .bold))
                                    .foregroundColor(Color("titleTextColor"))
                                    .padding(10)
                            }
                         
                        }.frame(height: 70.0)
                        
                        Section{
                            HStack {
                                ForEach(categories, id: \.self) { category in
                                    CustomImageButton(category.getName, action: {
                                        putSelectedItem(category)
                                    })
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                        } header: {
                            Text("종류")
                                .font(Font.system(size: 20))
                        }
                        Section{
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(foods, id: \.self) { food in
                                        CustomImageButton(food.getName, action: {
                                            putSelectedItem(food)
                                        })
                                    }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                                .padding(10)
                            }
                            
                        } header: {
                            Text("음식")
                                .font(Font.system(size: 20))
                        }
                        Section{
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(fravors, id: \.self) { fravor in
                                        CustomImageButton(fravor.getName, action: {
                                            putSelectedItem(fravor)
                                        })
                                    }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                                .padding(10)
                            }
                        } header: {
                            Text("맛")
                                .font(Font.system(size: 20))
                        }
                        
                        Section {
                            ScrollView(.horizontal) {
                                HStack {
                                    Spacer()
                                    ForEach(selectedFavorit, id: \.self) { item in
                                        VStack {
                                            CustomImageButton(item.getName, size: 40, action: {
                                                putSelectedItem(item)
                                            })
                                            Text(item.getKoreaName)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text("이렇게 찾을래")
                        
                    }
                })
            
        
    }
}

struct SettingDetail_Previews: PreviewProvider {
    @State static var selectedFavoritForPreview: [ChoiceEnum] = []
    
    static var previews: some View {
        SettingDetail(selectedFavorit: self.$selectedFavoritForPreview)
    }
}


//                    VStack{
//                        HStack {
//                            Text("종류")
//                                .padding(10)
//                                .font(.system(size: 25, weight: .heavy))
//                                .foregroundColor(Color.gray)
//                            Spacer()
//                        }
//
//                        HStack {
//                            CustomImageButton(ChoiceEnum.korea.getName, action: {
//                                putSelectedItem(ChoiceEnum.korea)
//                            })
//                            CustomImageButton(ChoiceEnum.japen.getName, action: {
//                                putSelectedItem(ChoiceEnum.japen)
//                            })
//                            CustomImageButton(ChoiceEnum.westen.getName, action: {
//                                putSelectedItem(ChoiceEnum.westen)
//                            })
//                            CustomImageButton(ChoiceEnum.china.getName, action: {
//                                putSelectedItem(ChoiceEnum.china)
//                            })
//                        }
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
//                        .padding(.bottom, 10)
//
//                    }
//                    .background(Color.white)
//                    .cornerRadius(10)
                    
//                    VStack{
//                        HStack {
//                            Text("음식")
//                                .padding(10)
//                                .font(.system(size: 25, weight: .heavy))
//                                .foregroundColor(Color.gray)
//                            Spacer()
//                        }
//
//                        ScrollView(.horizontal) {
//                            HStack {
//                                CustomImageButton(ChoiceEnum.rice.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.rice)
//                                })
//                                CustomImageButton(ChoiceEnum.bread.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.rice)
//                                })
//                                CustomImageButton(ChoiceEnum.soup.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.soup)
//                                })
//                                CustomImageButton(ChoiceEnum.meat.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.meat)
//                                })
//                                CustomImageButton(ChoiceEnum.chicken.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.chicken)
//                                })
//                                CustomImageButton(ChoiceEnum.tteok.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.tteok)
//                                })
//                                CustomImageButton(ChoiceEnum.burger.getName, size: 40, action: {
//                                    putSelectedItem(ChoiceEnum.burger)
//                                })
//                            }
//                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
//                            .padding(10)
//                        }
//
//
//                    }
//                    .background(Color.white)
//                    .cornerRadius(10)
//
//                    VStack{
//                        HStack {
//                            Text("맛")
//                                .padding(10)
//                                .font(.system(size: 25, weight: .heavy))
//                                .foregroundColor(Color.gray)
//                            Spacer()
//                        }
//
//                        HStack {
//                            CustomImageButton(ChoiceEnum.chili.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.chili)
//                            })
//                            CustomImageButton(ChoiceEnum.oily.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.oily)
//                            })
//                            CustomImageButton(ChoiceEnum.hot.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.hot)
//                            })
//                            CustomImageButton(ChoiceEnum.cold.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.cold)
//                            })
//                            CustomImageButton(ChoiceEnum.honey.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.honey)
//                            })
//                            CustomImageButton(ChoiceEnum.salt.getName, size: 40, action: {
//                                putSelectedItem(ChoiceEnum.salt)
//                            })
//                        }
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
//                        .padding(.bottom, 10)
//
//                    }
//                    .background(Color.white)
//                    .cornerRadius(10)
