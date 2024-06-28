//
//  ContentView.swift
//  Animations
//
//  Created by Maria Vounatsou on 15/5/24.
//

import SwiftUI
//Building custom transitions using ViewModifier

struct CorRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
             .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CorRotateModifier(amount: -90, anchor: .topLeading),
            identity: CorRotateModifier(amount: 0, anchor: . topLeading)
            )
    }
}

struct ContentView: View {

    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Snake by letters. Animation gestures

//struct ContentView: View {
//    let letters = Array("Hello SwiftUI")
//        @State private var enabled = false
//        @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .yellow)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//        DragGesture()
//            .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//    }
//}

////Showing and hiding views with transitions
//
//struct ContentView: View {
//    @State private var isShowingRed = false
//
//    var body: some View {
//        VStack {
//            Button("Tap me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
//        //.animation(.default, value: isShowingRed)
//    }
//}
