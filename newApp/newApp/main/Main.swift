//
//  Main.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI
import CoreLocation

@available(iOS 15.0, *)
struct Main: View {
    @State private var isShowReslutModal: Bool = false        // 결과 모달 show/hide
    @State private var isShowFavoritModal: Bool = false       // 선호 음식 모달 show/hide
    @State private var isShowLoading: Bool = true             // 로딩창 show/hide
    @State private var isLocationHideLoading: Bool = true     // 현재위치 로딩 show/hide
    @State private var myLocation: String = ""                  // 내위치
    @State private var hatedFood: String = ""                   // 싫어하는 음식
    @State var selectedFavorit: [ChoiceEnum] = []
    @State private var hateFoods: [String] = []
    @State var toast: Toast? = nil
    @FocusState private var focusState: Bool
    
    @ObservedObject var network: NetWork = NetWork.shared
    
    // 위치 권한 획득
    var location = LoactionService()
    
    // 자기 위치 설정
    func getLoaction() {
        location.requestLocation { coordinate in
            //latitude: 위도, 도: 경도
            let findLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let geocoder = CLGeocoder()
            let locale = Locale(identifier: "Ko-kr")
            geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
                if let address: [CLPlacemark] = placemarks {
                    if let description: String = address.last?.description {
                        print((address.last?.description ?? "").components(separatedBy: ", ")[1])
                        
                        myLocation = (description).components(separatedBy: ", ")[1]
                        isLocationHideLoading = true
                       
                    }
                }
            })
        }
    }
    
    // 선호 음식 설정
    func getFavorits() {
        for favorit in selectedFavorit {
            print("favorit \(favorit)")
        }
    }
    
    // 싫어하는 음식 제거
    func remoteHateFood(food: String) -> Void {
        var findIdx: Int = hateFoods.lastIndex(of: food) ?? -1
        
        if (findIdx > -1) {
            hateFoods.remove(at: findIdx)
        }
    }
    
    // 싫어하는 음식 추가
    func addHateFood() {
        if (hatedFood.trimmingCharacters(in: .whitespaces) == "") {
            toast = Toast(type: .warning, message: "내용을 입력해 주세요.")
            return
        }
        
        if hateFoods.contains(hatedFood) {
            toast = Toast(type: .warning, message: "이미 추가된 음식 입니다.")
        } else {
            hateFoods.append(hatedFood)
            
            hatedFood = ""
        }
    }
    
    
    var body: some View {
        Color("windowBackground").ignoresSafeArea() // 최상단, 최하단 safeArea 까지 배경을 넣기 위해 추가
            .overlay(
                ZStack{
                    VStack {
                        ProgressView().hidden(isShowLoading)
                    }
                    VStack {
                        List {
                            Section {
                                ZStack {
                                    ProgressView().hidden(isLocationHideLoading)
                                    Text(myLocation)
                                }
                            } header: {
                                HStack {
                                    Image(systemName: "globe.central.south.asia.fill")
                                    Text("현재 지역")
                                }.onTapGesture {
                                    isLocationHideLoading.toggle()
                                    getLoaction()
                                }
                            }
                            
                            Section {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(selectedFavorit, id: \.self) { favorit in
                                            VStack{
                                                CustomImageButton(favorit.getName)
                                                Text(favorit.getKoreaName)
                                            }
                                        }
                                    }
                                    .padding(10)
                                }.onTapGesture {
                                    self.isShowFavoritModal.toggle()
                                }
                                
                            } header: {
                                HStack {
                                    Image(systemName: "magnifyingglass.circle")
                                    Text("이걸로 찾아줘")
                                }.onTapGesture {
                                    self.isShowFavoritModal.toggle()
                                }.sheet(isPresented: self.$isShowFavoritModal, onDismiss: {
                                    getFavorits()
                                }) {
                                    // sheet 의 isPresented를 동일변수로 사용하려 했으나 이상동작으로 분리
                                    if isLocationHideLoading {
                                        SettingDetail(selectedFavorit: self.$selectedFavorit)
                                    }
                                }
                            }
                            
                            Section {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(hateFoods.reversed(), id: \.self) { food in
                                            CustomTextBox(content: food, action: {
                                                remoteHateFood(food: food)
                                            })
                                        }
                                    }.padding(.bottom, 20)
                                        .padding(.top, 5)
                                }
                                
                                
                                HStack {
                                    TextField("싫어하는 음식을 입력해 주세요.", text: $hatedFood)
                                        .multilineTextAlignment(.center)
                                        .focused($focusState)
                                        .onSubmit {
                                            addHateFood()
                                            self.focusState = true
                                        }
                                    Button {
                                        if self.focusState {
                                            addHateFood()
                                        }
                                    } label: {
                                        Image(systemName: "plus.diamond").frame(width: 25.0, height: 25.0)
                                    }
                                }
                            } header: {
                                Text("싫어하는 음식")
                            }
                        }.toastView(toast: $toast)
                        
                        Button {
//                            self.isShowReslutModal = true
//                            isShowLoading = !isShowLoading
                            if (network.state == .loading) {
                                isShowLoading = false
                            } else {
                                isShowLoading = true
                            }
                            NetWork().getData(url: "https://stageapi.i-screamcall.co.kr/app/version/ios")
                        } label: {
                            Text("선택 !!")
                        }
                        .sheet(isPresented: self.$isShowReslutModal) {
                            if isLocationHideLoading {
                                ResultModal()
                            }
                        }
                    }
                }
            )
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            Main()
        } else {
            // Fallback on earlier versions
        }
    }
}
