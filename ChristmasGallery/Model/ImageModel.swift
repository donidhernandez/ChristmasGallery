//
//  ImageModel.swift
//  ChristmasGallery
//
//  Created by Doni on 12/21/22.
//

import Foundation

struct ImageModel: Identifiable {
    let id: UUID = UUID()
    let imageName: String
}

extension ImageModel {
    static let imagesData: [ImageModel] = [
        ImageModel(imageName: "christmas-1"),
        ImageModel(imageName: "christmas-2"),
        ImageModel(imageName: "christmas-3"),
        ImageModel(imageName: "christmas-4"),
    ]
    
    func thumbnailName() -> String {
        return "thumb-\(imageName)"
    }
}



