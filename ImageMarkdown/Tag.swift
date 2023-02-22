//
//  Tag.swift
//  ImageMarkdown
//
//  Created by Горячев Александр on 22.02.2023.
//

import SwiftUI

struct Tag: View {
    var tag: String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.blue)
                .cornerRadius(5)
            VStack(){
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "minus.circle")
                        .frame(alignment: .topTrailing)
                }
                Spacer()
                Text(tag)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 0)
                Spacer()
            }.frame(minWidth: 10, maxWidth: 100, minHeight: 40, maxHeight: 40)
                
        }.frame(minWidth: 10, maxWidth: 100, minHeight: 40, maxHeight: 40)
        
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag(tag:"Wow")
    }
}
