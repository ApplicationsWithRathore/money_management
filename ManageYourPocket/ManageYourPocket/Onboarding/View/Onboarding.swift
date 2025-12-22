//
//  Onboarding.swift
//  ManageYourPocket
//
//  Created by Jitendra Rathore on 11/12/25.
//
import SwiftUI

struct Onboarding: View {
    let textArray: [String] = [
        "Welcome to Manage Your Pocket!",
        "Track your spending easily!",
        "Gain control over your finances!"
    ]
    
    @State private var isSecondOnboarding: Bool = false
    var milliseconds: Int = 1000
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Onboarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        ForEach(Array(textArray.enumerated()), id: \.offset) { index, text in
                            TextAndImageView(
                                finalText: text,
                                index: index,
                                seconds: index * milliseconds
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 50)
                    .padding(.bottom, 24)
                    Spacer()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Button("MYP can help!") {
                        isSecondOnboarding = true
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 24)

                    Button("I have a MYP account") {
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 24)
                }
            }
            .navigationDestination(isPresented: $isSecondOnboarding) {
                OnbardingSecond()
            }
            .padding(24)
        }
    }
}

struct TextAndImageView: View {
    @State private var displayedText: String = ""
    let finalText: String
    let characters: [Character]
    let index: Int
    let seconds: Int
    var horizontalAlignment: HorizontalAlignment {
        index % 2 == 0 ? .leading : .trailing
    }
    
    init(finalText: String, index: Int, seconds: Int) {
        self.finalText = finalText
        self.characters = Array(finalText)
        self.index = index
        self.seconds = seconds
    }
    
    var body: some View {
        HStack {
            if horizontalAlignment == .trailing {
                Spacer().frame(width: 60)
            }
            Text(displayedText)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 9)
                .padding(.vertical, 14)
                .background(Color.black.opacity(0.6))
                .cornerRadius(24)
                .shadow(radius: 4)
                .task { await typeWriter() }
            if horizontalAlignment == .leading {
                Spacer().frame(width: 60)
            }
        }
    }
    
    private func typeWriter() async {
        try? await Task.sleep(for: .milliseconds(seconds))
        if displayedText.isEmpty {
            for char in characters {
                displayedText.append(char)
                try? await Task.sleep(for: .milliseconds(30))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    Onboarding()
}
