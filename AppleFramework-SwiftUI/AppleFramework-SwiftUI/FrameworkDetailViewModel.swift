//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by jayden on 2023/03/13.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
