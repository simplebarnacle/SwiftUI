//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by jayden on 2023/03/13.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
}
