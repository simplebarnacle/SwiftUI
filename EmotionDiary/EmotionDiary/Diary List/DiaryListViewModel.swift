//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by jayden on 2023/03/14.
//

import Foundation
import Combine

final class DiaryListViewModel:ObservableObject {
    
    
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String : [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    // 데이터 파일에서 일기 리스트를 가져오기
    // 리스트에 해당 일기를 세팅
    // 리스트 세팅되면 dic 세팅
    
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 }
    }
    
    private func bind() {
        $list.sink { items in
            print("List changed: \(items)")
            
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier})
            self.persist(items: items)
        }.store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
