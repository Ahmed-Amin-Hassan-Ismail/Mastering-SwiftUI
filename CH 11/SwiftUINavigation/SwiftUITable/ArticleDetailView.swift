//
//  ArticleDetailView.swift
//  SwiftUINavigation
//
//  Created by Ahmed Amin on 11/01/2022.
//  Copyright © 2022 AppCoda. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    
    var body: some View {
        VStack {
            Image(article.image)
                .resizable()
                .aspectRatio(nil, contentMode: .fill)
                .clipped()
            
            Text(article.title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                
                
            Text(article.author)
                .font(.system(.title, design: .rounded))
                .fontWeight(.light)
        }
    }
}

