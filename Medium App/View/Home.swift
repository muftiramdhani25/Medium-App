//
//  Home.swift
//  Medium App
//
//  Created by abdullah irianda on 20/02/21.
//

import SwiftUI

struct Home: View {
  
  var split_Article : [[String]]{
    let Mid = articleParagraphs.count / 2
    
    var splitArray1 : [String] = []
    var splitArray2 : [String] = []
    
    for index in 0..<Mid - 1{
      splitArray1.append(articleParagraphs[index])
    }
    
    for index in Mid..<articleParagraphs.count{
      splitArray2.append(articleParagraphs[index])
    }
    
    return [splitArray1, splitArray2]
  }
  
  var body: some View {
    ScrollView{
      LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
        
        Section(footer: FooterView()){
          Text("I never wanted to post about this online, but ...")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.primary)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
          
          // profile
          HStack(spacing: 15){
            Image("profile")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 55, height: 55)
              .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5, content: {
              Text("Mufti Ramdhani")
                .foregroundColor(.green)
              
              Text("21 Feb 2020 .  4 min read")
                .font(.caption)
                .foregroundColor(.gray)
            })
            
            Spacer()
            
            Button(action: {}, label: {
              Image(systemName: "square.and.arrow.up")
                .font(.title2)
                .foregroundColor(.gray)
            })
            
            Button(action: {}, label: {
              Image(systemName: "bookmark")
                .font(.title2)
                .foregroundColor(.gray)
            })
          }
          .padding(.horizontal)
          
          // article paragraf
          ForEach(split_Article[0], id: \.self){ article in
            
            Text(article)
              .foregroundColor(.primary)
              .padding(.horizontal)
              .padding(.top, 15)
            
          }
          
          Image("article_img1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.horizontal)
            .padding(.top, 10)
          
          ForEach(split_Article[1], id: \.self){ article in
            
            Text(article)
              .foregroundColor(.primary)
              .padding(.horizontal)
              .padding(.top, 15)
            
          }
          
          Image("article_img2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.horizontal)
            .padding(.top, 10)
        }
        
        Text("Featured")
          .font(.title)
          .fontWeight(.heavy)
          .foregroundColor(.primary)
          .padding(.horizontal)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        
        FeaturedContent()
          .padding(.bottom)
      })
    }
    .ignoresSafeArea(.all, edges: .bottom)
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct FeaturedContent: View {
  var body: some View{
    VStack(spacing: 15){
      HStack(spacing: 15){
        Image("featured1")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 70, height: 70)
          .cornerRadius(10)
        
        Text("Instead what this shows is that, like how eating healthfully doesn’t need to be eating only salads")
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack(spacing: 15){
        Image("featured2")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 70, height: 70)
          .cornerRadius(10)
        
        Text("This is not a call against working out. I love working out, and spend a few hours a week running, biking, swimming, and completing calisthenic exercises")
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack(spacing: 15){
        Image("featured3")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 70, height: 70)
          .cornerRadius(10)
        
        Text("I don’t doubt the advantages of a good sweat, and find that it boosts both my physical and mental health.")
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
  }
}
