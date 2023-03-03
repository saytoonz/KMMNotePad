//
//  MultilineTextView.swift
//  iosApp
//
//  Created by Sam on 01/03/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTextView>) -> UITextView {
        let textView = UIKitTextView()
    
        
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: UIViewRepresentableContext<MultilineTextView>) {
        if textView.text != self.text {
            textView.text = self.text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    final private class UIKitTextView: UITextView {
        override var contentSize: CGSize {
            didSet {
                invalidateIntrinsicContentSize()
            }
        }
        
        override var intrinsicContentSize: CGSize {
            // Or use e.g. `min(contentSize.height, 150)` if you want to restrict max height
            CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
        }
    }
    
    final class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        
        init(text: Binding<String>) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            text.wrappedValue = textView.text
        }
    }
}
