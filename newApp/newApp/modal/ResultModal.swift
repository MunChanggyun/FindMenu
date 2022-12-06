//
//  ResultModal.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI

@available(iOS 15.0, *)
struct ResultModal: View {
    @Environment(\.presentationMode) var presentation
    @State var marketList = ["stores" : [["url": "https://www.naver.com", "content": "이가네 양꼬치"],
                             ["url": "https://pcmap.place.naver.com/restaurant/list?query=%ED%8C%90%EA%B5%90%20%EB%A7%9B%EC%A7%91&clientX=127.1163916&clientY=37.4060784&x=127.1122073&y=37.4060784&ts=1669268159324&mapUrl=https%3A%2F%2Fmap.naver.com%2Fv5%2Fsearch%2F%25ED%258C%2590%25EA%25B5%2590%2520%25EB%25A7%259B%25EC%25A7%2591#", "content": "아르틴"],
                             ["url": "https://pcmap.place.naver.com/restaurant/list?query=%ED%8C%90%EA%B5%90%20%EB%A7%9B%EC%A7%91&clientX=127.1163916&clientY=37.4060784&x=127.1122073&y=37.4060784&ts=1669268159324&mapUrl=https%3A%2F%2Fmap.naver.com%2Fv5%2Fsearch%2F%25ED%258C%2590%25EA%25B5%2590%2520%25EB%25A7%259B%25EC%25A7%2591#", "content": "이야기툴"],
                             ["url": "https://pcmap.place.naver.com/restaurant/list?query=%ED%8C%90%EA%B5%90%20%EB%A7%9B%EC%A7%91&clientX=127.1163916&clientY=37.4060784&x=127.1122073&y=37.4060784&ts=1669268159324&mapUrl=https%3A%2F%2Fmap.naver.com%2Fv5%2Fsearch%2F%25ED%258C%2590%25EA%25B5%2590%2520%25EB%25A7%259B%25EC%25A7%2591#", "content": "배키욘방 판교점"],
                             ["url": "https://pcmap.place.naver.com/restaurant/list?query=%ED%8C%90%EA%B5%90%20%EB%A7%9B%EC%A7%91&clientX=127.1163916&clientY=37.4060784&x=127.1122073&y=37.4060784&ts=1669268159324&mapUrl=https%3A%2F%2Fmap.naver.com%2Fv5%2Fsearch%2F%25ED%258C%2590%25EA%25B5%2590%2520%25EB%25A7%259B%25EC%25A7%2591#", "content": "샤오바오 서현점"]],
                             "blogs":[
                                ["url": "https://search.naver.com/p/crd/rd?m=1&px=688&py=1258&sx=688&sy=586&p=h33T%2BlprvmsssmMhuqGssssstaN-142765&q=%ED%8C%90%EA%B5%90+%EC%9D%B4%EA%B0%80%EB%84%A4+%EC%96%91%EA%BC%AC%EC%B9%98&ie=utf8&rev=1&ssc=tab.nx.all&f=nexearch&w=nexearch&s=th%2F%2F1tUjEVe4nFgh5xW4vg%3D%3D&time=1669191475059&abt=%5B%7B%22eid%22%3A%22SMB-COVERAGE-V2%22%2C%22vid%22%3A%224%22%7D%2C%7B%22eid%22%3A%22SHP-AD-UP%22%2C%22vid%22%3A%2213%22%7D%2C%7B%22eid%22%3A%22SBR1%22%2C%22vid%22%3A%22513%22%7D%5D&a=rvw*b.link&r=2&i=90000003_0000000000000033E6A481B6&u=https%3A%2F%2Fblog.naver.com%2Fdbrvh123%2F222912872886&cr=2", "content": "판교 이가네 양꼬치 웨이팅..."],
                                ["url": "https://blog.naver.com/kyd5209/222801055279", "content": "이가네 양꼬치 판교..."],
                                ["url": "https://blog.naver.com/oa2020/222929806065", "content": "판교 아브뉴프랑 맛집..."],
                                
                             ]]
    @State var blogList: [String] = []
    
    var body: some View {
        Color("windowBackground").ignoresSafeArea().overlay {
//        Color.red.ignoresSafeArea().overlay {
            
            VStack {
                Spacer()
                VStack{
                    CustomLink(fontColor: Color("titleTextColor"), fontSize: 40.0, linkURL: URL(string: marketList["stores"]?.first?["url"] ?? "")!, iconImage: Image("first"),
                               content: marketList["stores"]?.first?["content"] ?? "", imageSize: 60.0)
                    ForEach(marketList["blogs"] ?? [], id: \.self) { blog in
                        CustomLink(fontColor: Color("contentTextColor"), fontSize: 15.0, linkURL: URL(string: blog["url"] ?? "")!, iconImage: Image(systemName: "link"), content: blog["content"] ?? "", imageSize: 15.0).padding(.leading, 20)

                    }
                }.padding(.horizontal, 30.0)
                    .padding(.vertical, 20.0)
                    
                .background(Color.white)
                .cornerRadius(20.0)
                
                VStack (alignment: .leading) {
                    ForEach(1..<(marketList["stores"]?.count ?? 1)){ index in
                        CustomLink(fontColor: Color("contentTextColor"), fontSize: 20.0, linkURL: URL(string: marketList["stores"]?[index]["url"] ?? "")!, iconImage: Image("number_\(index + 1)"), content: marketList["stores"]?[index]["content"] ?? "", imageSize: 30.0)
                        Divider()
                    }
                }.padding(.horizontal, 30.0)
                    .padding(.vertical, 20.0)
                    
                .background(Color.white)
                .cornerRadius(20.0)
                Spacer()
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("다시 선택")
                }
            }.padding(.horizontal, 20.0)
        }
        
    }
}

struct ResultModal_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ResultModal()
        } else {
            // Fallback on earlier versions
        }
    }
}
