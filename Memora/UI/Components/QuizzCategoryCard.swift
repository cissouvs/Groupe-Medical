//
//  QuizzCategoryCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzCategoryCard: View {
    
    var quizz: Quizz
    
    var mainColorCategory: Color {
        switch quizz.category {
                case .family: return .supportRed
                case .activity: return .supportOrange
                case .meal: return .supportGreen
                case .visitedPlaces: return .supportBlue
                }
    }
    
    var secondaryColorCategory: Color {
        switch quizz.category {
        case .family: return .tagRed
        case .activity: return .tagOrange
        case .meal: return .tagGreen
        case .visitedPlaces: return .tagBlue
        }
    }
    
    var titleCategory: String {
        switch quizz.category {
        case .family:
            return "Famille"
        case .activity:
            return "Activité"
        case .meal:
            return "Alimentation"
        case .visitedPlaces:
            return "Lieux visités"
        }
    }
    
    var categoryPicture: String{
        switch quizz.category {
        case .family:
            return "familyPicture"
        case .activity:
            return "activityPicture"
        case .meal:
            return "mealPicture"
        case .visitedPlaces:
            return "visitedPlacesPicture"
        }
    }
    
    var descriptionCategory: String {
        switch quizz.category {
        case .family:
            return "Relations & moments précieux"
        case .activity:
            return "Loisirs, sport & temps libre"
        case .meal:
            return "Goûts, recettes & habitudes"
        case .visitedPlaces:
            return "Voyages & évasions"
        }
    }
    
    var symboleCategory: String {
        switch quizz.category {
        case .family:
            return "heart.fill"
        case .activity:
            return "leaf.fill"
        case .meal:
            return "fork.knife.circle.fill"
        case .visitedPlaces:
            return "camera.fill"
        }
    }
    
    var body: some View {
        NavigationLink {
            DetailQuizzView()
        } label: {
            VStack(spacing: 10) {
                ZStack(alignment: .topTrailing){
                    Image(categoryPicture)
                        .resizable()
                        .scaledToFill()
                    Image(systemName: symboleCategory)
                        .frame(width: 25, height: 20)
                        .padding(5)
                        .background(.whiteBackground)
                        .cornerRadius(10)
                        .padding(5)
                }
                VStack(alignment: .leading){
                    Text(titleCategory)
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.medium)
                    HStack {
                        Text(descriptionCategory)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 10))
                        Spacer()
                        Text("6 questions")
                            .font(.system(size: 9))
                            .padding(3)
                            .background(secondaryColorCategory)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondText)
                    
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 12)
            }
            .foregroundStyle(mainColorCategory)
            .frame(width: 180, height: 200)
            .background(Color.whiteBackground)
            .cornerRadius(20)
        }
    }
}

#Preview {
    QuizzCategoryCard(quizz: familyQuizz)
}
