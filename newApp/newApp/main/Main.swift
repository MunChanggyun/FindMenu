//
//  Main.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI
import CoreLocation

struct Main: View {
    @State private var isShowReslutModal = false        // 결과 모달 show/hide
    @State private var isShowFavoritModal = false       // 선호 음식 모달 show/hide
    @State private var isHideLoading = true             // 로딩창 show/hide
    @State private var isLocationHideLoading = true     // 현재위치 로딩 show/hide
    @State private var myLocation = ""                  // 내위치
    @State private var hatedFood = ""                   // 싫어하는 음식
    
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
                    if let name: String = address.last?.name {
                        print((address.last?.description ?? "").components(separatedBy: ", ")[1])
                        
                        myLocation = (address.last?.description ?? "").components(separatedBy: ", ")[1]
                        isLocationHideLoading = true
                       
                    }
                }
            })
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    ProgressView().hidden(isHideLoading)
                }
                VStack {
                    Spacer()
                    HStack {
                        Text("현재 지역")
                        Button {
                            isLocationHideLoading = false
                            getLoaction()
                        } label: {
                            Image(systemName: "globe.central.south.asia.fill")
                        }

                    }
                    ZStack {
                        ProgressView().hidden(isLocationHideLoading)
                        Text(myLocation).padding(.bottom, 20)
                            .padding(.top, 5)
                    }
                    
                    HStack {
                        Button {
                            self.isShowFavoritModal = true
                        } label: {
                            
                            Text("이걸로 찾아줘").foregroundColor(Color.black)
                            Image(systemName: "magnifyingglass.circle")
                        }
                        .sheet(isPresented: self.$isShowFavoritModal) {
                            if isLocationHideLoading {
                                SettingDetail()
                            }
                        }

                    }
                    
                    HStack {
                        Text("면")
                        Text("매운음식")
                    }.padding(.bottom, 20)
                        .padding(.top, 5)
                    Text("싫어하는 음식")
                    TextField("싫어하는 음식을 입력해 주세요.", text: $hatedFood)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                    Button {
                        self.isShowReslutModal = true
                        isHideLoading = !isHideLoading
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
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
