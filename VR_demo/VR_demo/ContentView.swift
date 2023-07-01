//
//  ContentView.swift
//  VR_demo
//
//  Created by Jing Han on 2023/5/26.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UIGestureRecognizer(target: context.coordinator, action:
            #selector(Coordinator.handleTap)))
        
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        let boxMaterial = SimpleMaterial(color: .blue, isMetallic: true)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [boxMaterial])
//        box.position = simd_float3(-0.1, -0.1, -0.1)
//        let sphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.2), materials: [SimpleMaterial(color: .brown, isMetallic: true)])
//        sphere.position = simd_float3(0.2, 0.2, 0.2)
//
//        let plane = ModelEntity(mesh: MeshResource.generatePlane(width: 0.5, depth: 0.3), materials: [SimpleMaterial(color: .red, isMetallic: true)])
//        plane.position = simd_float3(-0.1,0.6,0)
//
//        let text = ModelEntity(mesh: MeshResource.generateText("OK Apple", extrusionDepth: 0.03, font: .systemFont(ofSize: 0.4), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping), materials: [SimpleMaterial(color: .black, isMetallic: true)])
        
        box.generateCollisionShapes(recursive: true)
        
        anchor.addChild(box)
//        anchor.addChild(sphere)
//        anchor.addChild(plane)
//        anchor.addChild(text)
        arView.scene.anchors.append(anchor)
        
        
        return arView
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
