//
//  doggy.swift
//  peter_Demo
//
//  Created by Jing Han on 2023/4/10.
//

import SwiftUI

struct doggy: View {
    var body: some View {
        VStack {
            Image("dog")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            
        }
        
            
            
            
    }
}

struct doggy_Previews: PreviewProvider {
    static var previews: some View {
        doggy()
    }
}
