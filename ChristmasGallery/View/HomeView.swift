//
//  HomeView.swift
//  ChristmasGallery
//
//  Created by Doni on 12/21/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            DraggableImageView(imageOffset: $imageOffset, imageScale: $imageScale)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
