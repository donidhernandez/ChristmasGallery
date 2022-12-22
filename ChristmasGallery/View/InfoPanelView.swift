//
//  InfoPanelView.swift
//  ChristmasGallery
//
//  Created by Doni on 12/22/22.
//

import SwiftUI

struct InfoPanelView: View {
    
    var imageOffset: CGSize
    var imageScale: CGFloat
    
    @State private var infoPanelIsVisible: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "circle.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .onLongPressGesture {
                    infoPanelIsVisible.toggle()
                }
            
            Spacer()
            
            
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(imageScale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(imageOffset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(imageOffset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .frame(maxWidth: 420)
            .opacity(infoPanelIsVisible ? 1 : 0)
            .animation(.linear(duration: 1), value: infoPanelIsVisible)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(imageOffset: .zero, imageScale: 1)
            .preferredColorScheme(.dark)
    }
}
