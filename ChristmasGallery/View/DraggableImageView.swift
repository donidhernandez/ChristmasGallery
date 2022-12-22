//
//  DraggableImageView.swift
//  ChristmasGallery
//
//  Created by Doni on 12/21/22.
//

import SwiftUI

struct DraggableImageView: View {
    
    @Binding var imageOffset: CGSize
    @Binding var imageScale: CGFloat
    
    func resetImagePos() {
        imageScale = 1
        imageOffset = .zero
    }
    
    var body: some View {
        Image("christmas-1")
            .resizable()
            .scaledToFit()
            .frame(width: 320)
            .cornerRadius(20)
            .scaleEffect(imageScale)
            .offset(imageOffset)
            .shadow(color: Color("Gray"), radius: 12, x: 0, y: 5)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        withAnimation(.spring()) {
                            imageOffset = gesture.translation
                        }
                    }
                    .onEnded{ gesture in
                        withAnimation(.spring()) {
                            if imageScale <= 1 {
                                resetImagePos()
                            }
                        }
                    }
            )
            .onTapGesture(count: 2) {
                withAnimation(.spring()) {
                    if imageScale <= 1 {
                        imageScale = 5
                    } else {
                        resetImagePos()
                    }
                }
            }
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        withAnimation(.linear(duration: 1)) {
                            if imageScale >= 1 && imageScale <= 5 {
                                imageScale = value
                                
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                    }
                    .onEnded { _ in
                        if imageScale > 5 {
                            imageScale = 5
                        } else if imageScale <= 1 {
                            resetImagePos()
                        }
                    }
            )
    }
}

struct DraggableImageView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableImageView(imageOffset: .constant(.zero), imageScale: .constant(1))
    }
}
