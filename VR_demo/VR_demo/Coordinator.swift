//
//  Coordinator.swift
//  VR_demo
//
//  Created by Jing Han on 2023/6/2.
//

import Foundation
import ARKit
import RealityKit

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        
        if let entity = view.entity(at: tapLocation) as? ModelEntity {
            let material = SimpleMaterial(color: .red, isMetallic: true)
            entity.model?.materials = [material]
        }
    }
}
