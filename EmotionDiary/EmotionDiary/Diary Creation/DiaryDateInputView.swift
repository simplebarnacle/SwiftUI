//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

// 생성버튼 >> 날짜 입력 >> 감정 입력 >> 일기 내용 입력 >> 저장

struct DiaryDateInputView: View {
    
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                DatePicker("Start Date",
                           selection: $vm.date,
                           displayedComponents: [.date])
                .datePickerStyle(.graphical)
               
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView(vm: vm)
                } label: {
                    Text("NEXT")
                        .frame(width: 200, height: 80)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(40)
                }
            }
        }
        
        
        
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false), diaries: .constant(MoodDiary.list))
        DiaryDateInputView(vm: vm)
    }
}
