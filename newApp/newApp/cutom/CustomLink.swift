//
//  CustomLink.swift
//  FindMenu
//
//  Created by mac on 2022/11/24.
//

import SwiftUI

struct CustomLink: View {
    var fontColor: Color
    var fontSize: CGFloat
    var linkURL: URL
    var iconImage: Image
    var content: String
    var imageSize: CGFloat
    
    init(fontColor: Color = Color.black, fontSize: CGFloat = 20, linkURL: URL, iconImage: Image, content: String, imageSize: CGFloat = 20) {
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.linkURL = linkURL
        self.iconImage = iconImage
        self.content = content
        self.imageSize = imageSize
    }
    
    var body: some View {
        Link(destination: linkURL) {
            HStack {
                iconImage.resizable().frame(width: imageSize, height: imageSize).foregroundColor(fontColor)
                Text(content).font(Font.system(size: fontSize, weight: .bold)).foregroundColor(fontColor)
            }
        }
    }
}

struct CustomLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomLink(linkURL: URL(string: "https://www.naver.com")!, iconImage: Image(systemName: "carrot"), content: "이가네 양꼬치")
    }
}
