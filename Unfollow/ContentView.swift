//
//  ContentView.swift
//  Unfollow
//
//  Created by Omar on 03/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var numWarns = 0
    
    var body: some View {
        
        VStack(alignment:.leading){
            Rectangle().frame(height:80).ignoresSafeArea(.all)
            //profile image
            HStack(alignment: .center){
                VStack(alignment:.leading){
                    //circle
                    ZStack{
                        Circle().fill(.black)
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .frame(width:64, height:64)
                    //text
                    Text("خارج السياق").font(.system(size: 20, weight: .black)).padding(.top,-4)
                    Text("@user").font(.system(size: 16)).padding(.top,-12).foregroundColor(.gray)
                }
                
                //Spacer()
                Spacer()
                
                //buttons
                Menu{
                    
                    if numWarns < 1 {
                        // warn
                        Button {
                            numWarns = 1
                        } label: {
                            Label("Give Warning", systemImage: "exclamationmark.triangle")
                        }
                    }else{
                        // remove warn
                        Button {
                            numWarns = 0
                        } label: {
                            HStack{
                                Label("Remove warning", systemImage: "minus")
                            }
                        }
                    }
                    
                    // unfollow
                    Button(role:.destructive) {
                        //
                    } label: {
                        Label("Unfollow @User", systemImage: "xmark.circle")
                    }
                    
                    

                    
                } label: {
                    HStack{
                        Text("Following")
                            .bold()
                            .font(.system(size: 12))
                        
                        if numWarns > 0 {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size: 12, weight: .bold))
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal,12)
                    .padding(.vertical,8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .padding(.top,-54)
            .padding(.horizontal,24)
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
