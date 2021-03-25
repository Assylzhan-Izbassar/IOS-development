//
//  AnotationContext.swift
//  MapsApp
//
//  Created by macbook on 25.03.2021.
//

import Foundation

struct AnotationContext {
    public var annotationSet: [CustomAnnotationView]?
    
    public mutating func addAnnotation(_ newAnnotaion: CustomAnnotationView) {
        annotationSet?.append(newAnnotaion)
    }
    
    public mutating func removeAnnotation(_ index: Int) {
        annotationSet?.remove(at: index)
        
    }

}
