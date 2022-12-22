//
//  ControlImageView.swift
//  ChristmasGallery
//
//  Created by Doni on 12/21/22.
//

import SwiftUI

struct ControlImageView: View {
    
    @State var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .scaledToFit()
            .frame(width: 35)
            .padding(10)
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(systemImageName: "minus.magnifyingglass")
    }
}
