//
//  HomePage.swift
//  Red Cart
//
//  Created by Red Whale inc. on 02/12/2024.
//

import SwiftUI

struct HomePage : View {
    
    @State var searchRed: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color("topRed"), Color("bottomRed")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 15){
                    HStack(spacing: 10){
                        
                        Image(systemName: "location.north.fill")
                            .foregroundColor(.white)
                            .padding(2)
                            .frame(maxWidth: 40, maxHeight: 40)
                            .background(Color("primaryRed"))
                            .cornerRadius(50)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Deliver to:")
                                .font(.system(size: 13))
                            Text("Mississauga, Canada")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Change")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .clipShape(Rectangle())
                        .frame(width: 120, height: 48)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("topRed"), Color("bottomRed")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        
                        .cornerRadius(50)
                        
                    }
                    .padding(7)
                    .frame(maxWidth: 400, maxHeight: 60)
                    .background(Color.white)
                    .cornerRadius(50)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search Redcart.ca", text: $searchRed)
                        Image(systemName: "camera.viewfinder")
                    }
                    .padding(10)
                    .frame(maxWidth: 400, maxHeight: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack{
                        Highlight(highlightImage: "zara")
                        Highlight(highlightImage: "nike")
                        Highlight(highlightImage: "adidas")
                        Highlight(highlightImage: "gucci")
                        Highlight(highlightImage: "cartier")
                    }
                }
                .padding()
                
                VStack(spacing: 10){
                    Image("nike_shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 390, height: 220)
                        .clipShape(RoundedCornersShape(cornerRadius: 20, corners: [.topLeft, .topRight]))
                    
                    HStack{
                        switchLine(colorString: "red")
                        switchLine(colorString: "blue")
                        switchLine(colorString: "blue")
                    }
                    
                    
                    HStack{
                        Text("MOST POPULAR")
                            .font(.system(size: 15, weight: .bold))
                        Spacer()
                        Button(action: {}) {
                            Text("view more")
                                .foregroundColor(Color("primaryRed"))
                                .font(.system(size: 16, weight: .regular))
                                .underline()
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    HStack{
                        ListItems(listItemImage: "footwear")
                        ListItems(listItemImage: "bag")
                        ListItems(listItemImage: "beats")
                    }
                    Spacer()
                    
                }
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(25)
            }
            
            
            
        }
        .safeAreaInset(edge: .bottom) {
            Footer()
        }
    }
}

extension Color {
    static func fromString(_ colorName: String) -> Color {
        switch colorName.lowercased() {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case "yellow": return .yellow
        case "orange": return .orange
        case "purple": return .purple
        case "pink": return .pink
        case "gray", "grey": return .gray
        case "black": return .black
        case "white": return .white
        default: return .blue
        }
    }
}

struct RoundedCornersShape: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}


struct Highlight: View {
    var highlightImage: String = ""
    var body: some View {
        Image(highlightImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(20)
            .clipShape(.circle)
            .frame(maxWidth: 70, maxHeight: 70)
            .background(Color.white)
            .cornerRadius(50)
    }
}

struct switchLine: View {
    var colorString: String = "blue"
    var body: some View {
        Rectangle()
            .background(Color(colorString))
            .frame(width: 30, height: 4)
            .cornerRadius(50)
    }
}

struct ListItems: View {
    var listItemImage: String = ""
    var body: some View {
        Image(listItemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(10)
            .frame(maxWidth: 120, maxHeight: 150)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 1, x: 3, y: 3)
    }
}

#Preview {
    HomePage()
}
