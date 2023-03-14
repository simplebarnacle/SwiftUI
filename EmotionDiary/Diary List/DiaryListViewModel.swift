//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by jayden on 2023/03/14.
//

import Foundation


final class DiaryListViewModel:ObservableObject {
    
    
    
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String : [MoodDiary]] = [:]
    
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier})
        
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 }
    }
}
