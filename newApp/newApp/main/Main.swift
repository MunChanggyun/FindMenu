//
//  Main.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI
import CoreLocation

struct Main: View {
    @State private var showModal = false
    @State private var isHideLoading = true
    @State private var isLocationHideLoading = true
    @State private var myLocation = ""
    
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
    
    
    init() {
        
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
                    
                    Text("선호하는 음식")
                    HStack {
                        Text("면")
                        Text("매운음식")
                    }.padding(.bottom, 20)
                        .padding(.top, 5)
                    Text("싫어하는 음식")
                    HStack {
                        Text("마라탕")
                    }.padding(.bottom, 20)
                        .padding(.top, 5)
                    Spacer()
                    Button {
//                            self.showModal = true
                        isHideLoading = !isHideLoading
                                            } label: {
                        Text("선택 !!")
                    }.sheet(isPresented: self.$showModal) {
                        ResultModal()
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
