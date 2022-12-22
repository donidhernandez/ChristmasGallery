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
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    
    let images: [ImageModel] = ImageModel.imagesData
    @State private var pageIndex: Int = 1
    
    func resetImagePos() {
        imageScale = 1
        imageOffset = .zero
    }
    
    func currentPage() -> String {
        return images[pageIndex - 1].imageName
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear.ignoresSafeArea()
                
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(maxHeight: 550)
                    .scaleEffect(imageScale)
                    .offset(imageOffset)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .shadow(color: Color("Gray"), radius: 12, x: 2, y: 2)
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
            .onAppear {
                isAnimating = true
            }
            .navigationTitle("Christmas Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(
                InfoPanelView(imageOffset: imageOffset, imageScale: imageScale)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            .overlay (
                Group {
                    HStack {
                        Button {
                            withAnimation(.spring()) {
                                if imageScale <= 5 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImagePos()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(systemImageName: "minus.magnifyingglass")
                        }

                        Button {
                            withAnimation(.spring()) {
                                resetImagePos()
                            }
                        } label: {
                            ControlImageView(systemImageName: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        Button {
                            withAnimation(.spring()) {
                                if imageScale <= 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(systemImageName: "plus.magnifyingglass")
                        }
                    }
                }
                .padding(EdgeInsets(top: 1, leading: 12, bottom: 1, trailing: 12))
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                ,alignment: .bottom
            )
            .overlay (
                HStack(spacing: 12) {
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.spring()) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(images) { image in
                                Image(image.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                                    .opacity(isDrawerOpen ? 1 : 0)
                                    .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                                    .onTapGesture {
                                        isAnimating = true
                                        pageIndex = image.id
                                    }
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing)
        }
        .navigationViewStyle(.stack)
        
    }
       
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
