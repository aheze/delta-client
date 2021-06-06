//
//  BlockModel.swift
//  DeltaClient
//
//  Created by Rohan van Klinken on 31/3/21.
//

import Foundation

struct BlockModel {
  var fullFaces: Set<FaceDirection>
  var elements: [BlockModelElement]
}

extension BlockModel {
  init(fromCache cache: CacheBlockModel) {
    fullFaces = Set<FaceDirection>()
    for cacheFullFace in cache.fullFaces {
      if let fullFace = FaceDirection(fromCache: cacheFullFace) {
        fullFaces.insert(fullFace)
      }
    }
    elements = []
    for cacheElement in cache.elements {
      elements.append(BlockModelElement(fromCache: cacheElement))
    }
  }
  
  func toCache() -> CacheBlockModel {
    let cacheFullFaces = fullFaces.map {
      return $0.toCache()
    }
    
    let cacheElements = elements.map {
      return $0.toCache()
    }
    
    var cacheBlockModel = CacheBlockModel()
    cacheBlockModel.fullFaces = cacheFullFaces
    cacheBlockModel.elements = cacheElements
    
    return cacheBlockModel
  }
}