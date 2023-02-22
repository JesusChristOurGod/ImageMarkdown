//
//  ContentView.swift
//  ImageMarkdown
//
//  Created by Горячев Александр on 21.02.2023.
//

import SwiftUI

import PythonKit
struct ContentView: View {
    
    @State var result: String = ""
    @State var imagetype: String = ""
    var dirPath = "/Users/alexander/Desktop/ImageMarkdown/PyLogic/"
    var body: some View {
        HStack{
            Image("out_image")
                .resizable()
                .scaledToFit()
                .frame(width:300, height:500)
                .padding(.horizontal, 30)
            VStack(alignment: .trailing, spacing: 30){
                TextField("Image type", text: $imagetype)
                TextField("Image type", text: $imagetype)
                TextField("Image type", text: $imagetype)
                Spacer()
                Button(action: self.runPythonCode,
                       label: {
                    Text("PressMe")
                })
                Text("\(result)")
            }
            
        }
        .padding()
        
    }
    
    
    
    func runPythonCode(){
      let sys = Python.import("sys")
      sys.path.append(dirPath)
      let example = Python.import("sample")
      let response = example.hello(imagetype)
        result=response.description
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
