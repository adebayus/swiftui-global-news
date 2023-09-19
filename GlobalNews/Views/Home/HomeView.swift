//
//  HomeView.swift
//  GlobalNews
//
//  Created by mymac on 17/09/23.
//

import SwiftUI

struct HomeView: View {
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible()), // 1st column
        GridItem(.flexible())  // 2nd column
    ]
    
    var statusBarHeight: CGFloat {
        let statusBarFrame = UIApplication.shared.statusBarFrame
        return statusBarFrame.height
    }
    
    let bgColor: Color = Color(hex: 0x27374D)
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                
                VStack {
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: statusBarHeight)
                .background(bgColor)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hello,")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Welcome to GlobalNews")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("\"Your News, Your Way!\"")
                            .font(.system(size: 26, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .background(bgColor)
                .clipShape(
                    RoundedBottomCorners(cornerRadius: 20)
                )
                //            .edgesIgnoringSafeArea(.top)
                
                VStack {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.categories, id: \.self) { item in
                            NavigationLink(destination: SourcesView( categoryId: item.name.lowercased()), label: {
                                Text("\(item.name)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 150)
                                    .background(Color(item.nameColor))
                                    .cornerRadius(8)
                            })
                            
                        }
                    }
                    .padding()
                }
                
                
                
            }.background(Color.white)
        } .edgesIgnoringSafeArea(.top)
        
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct RoundedBottomCorners: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: rect.height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
        path.addArc(center: CGPoint(x: cornerRadius, y: rect.height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
