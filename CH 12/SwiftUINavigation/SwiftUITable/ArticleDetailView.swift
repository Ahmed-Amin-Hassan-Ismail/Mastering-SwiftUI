//
//  ArticleDetailView.swift
//  SwiftUINavigation
//
//  Created by Ahmed Amin on 11/01/2022.
//  Copyright © 2022 AppCoda. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Reminder"), message: Text("Are you sure you finish reading the article?"), primaryButton: .default(Text("Yes"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }), secondaryButton: .cancel(Text("Cancel")))
        })
        
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                        .padding(.trailing, 20)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                }
            }
        )
        .edgesIgnoringSafeArea(.top)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticleDetailView(article: articles[0])
        }
    }
}
