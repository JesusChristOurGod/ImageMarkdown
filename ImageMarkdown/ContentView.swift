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
    @State var imageType: String = ""
    @State var imageObject: String = ""
    @State var imageDetail: String = ""
    @State var imageName: String = ""
    @State var types: [String] = []
    @State var objects: [String] = []
    @State var details: [String] = []


    var dirPath = "/Users/alexander/Desktop/ImageMarkdown/PyLogic/"
    var body: some View {
        HStack{
            Image("out_image")
                .resizable()
                .scaledToFit()
                .frame(width:300, height:500)
                .padding(.horizontal, 30)
            VStack(alignment: .trailing, spacing: 30){
                Spacer()
                TextField("Image name", text: $imageName)
                    .onSubmit{
                        imageName = ""
                    }

                
                
                VStack(alignment: .leading, spacing: 10 ){
                    HStack{
                        ForEach(types, id: \.self) {tag in
                            Tag(tag: tag)
                        }
                    }
                    TextField("Image type", text: $imageType)
                        .onSubmit {
                            print("lol")
                            types.append(imageType)
                            imageType = ""
                        }
                       
                }
                
                VStack(alignment: .leading, spacing: 10 ){
                    HStack{
                        ForEach(objects, id: \.self) {tag in
                            Tag(tag: tag)
                        }
                    }
                    TextField("Image object", text: $imageObject)
                        .onSubmit {
                            objects.append(imageObject)
                            imageObject = ""
                        }
                        
                }
                
                VStack(alignment: .leading, spacing: 10 ){
                    HStack{
                        ForEach(details, id: \.self) {tag in
                            Tag(tag: tag)
                        }
                    }
                    TextField("Image detail", text: $imageDetail)
                        .onSubmit {
                            details.append(imageDetail)
                            imageDetail = ""
                        }
                        
                }
                Spacer()
                Button(action: self.runPythonCode,
                       label: {
                    Text("PressMe")
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.blue)
                Text("\(result)")
            }
            .frame(maxWidth:300)
            
        }
        .padding()
        
    }
    
    
    
    func runPythonCode(){
      let sys = Python.import("sys")
      sys.path.append(dirPath)
      let example = Python.import("sample")
      let response = example.hello(imageName, imageType, imageObject, imageDetail)
        result=response.description
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
