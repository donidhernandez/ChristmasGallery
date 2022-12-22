//
//  ImageModel.swift
//  ChristmasGallery
//
//  Created by Doni on 12/21/22.
//

import Foundation

struct ImageModel: Identifiable {
    let id: Int
    let imageName: String
}

extension ImageModel {
    static let imagesData: [ImageModel] = [
        ImageModel(id: 1, imageName: "christmas-1"),
        ImageModel(id: 2, imageName: "christmas-2"),
        ImageModel(id: 3, imageName: "christmas-3"),
        ImageModel(id: 4, imageName: "christmas-4"),
    ]
    
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}



