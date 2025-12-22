import SwiftUI
struct OnbardingSecond: View {
    var onboardingListTile: [(title: String, isClickable: Bool, buttonText: String, newButtonText: String)] =
    [("Rent", true, "Tap to fill", "5000"),
     ("Food", true, "Tap to fill", "4500"),
     ("Bike", false, "00", "1500"),
     ("Utilities", false, "00", "3000"),
     ("Saving", false, "00", "11000")]
    @State var titleText: String = "We will show you how to give every Rs a job"
    @State var clickedIndices: Set<Int> = []
    @State var allButtonsChanged: Bool = false
    @State var showBalance: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            Text(titleText)
                .bold()
                .font(.title)
                .padding(.leading, 24)
                .padding(.trailing, 24)
            if showBalance {
                HStack (alignment: .center) {
                    Image(.onboarding)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 10)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    Text("Balance: 25000")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(Color.white)
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                }
                .background(Color.gray)
                .clipShape(Capsule())
                .padding(10)
            }
            ForEach(Array(onboardingListTile.enumerated()), id: \.element.title) { index, item in
                OnboardingListTile(
                    title: item.title,
                    isClickable: item.isClickable,
                    buttonText: item.buttonText,
                    newButtonText: item.newButtonText,
                    isClicked: clickedIndices.contains(index),
                    shouldShowNewText: allButtonsChanged,
                    buttonTapped: {
                        clickedIndices.insert(index)
                        if clickedIndices.count == 2 {
                            updateUiAfterButtonClicked()
                        }
                    }
                )
                .clipShape(Capsule())
                .padding(.horizontal, 24)
            }
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
                   Button("Continue") {
                    
                   }
                   .frame(maxWidth: .infinity, minHeight: 50)
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .clipShape(Capsule())
                   .padding(.horizontal, 24)
                   .padding(.bottom, 10)
               }
    }
    private func updateUiAfterButtonClicked() {
        withAnimation(.easeInOut(duration: 0.3)) {
            showBalance = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            allButtonsChanged = true
            titleText = "And can still get what you want"
        }
    }
}

struct OnboardingListTile: View {
    var title: String
    var isClickable: Bool = false
    var buttonText: String = "Add"
    var newButtonText: String = ""
    var isClicked: Bool = false
    var shouldShowNewText: Bool = false
    var buttonTapped: () -> Void = { }
    
    var body: some View {
        HStack {
            Image(.onboarding)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(5)
            
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundStyle(Color.white)
            Spacer()
            Button(action: {
                if !isClicked && isClickable {
                    buttonTapped()
                }
            }) {
                Text(shouldShowNewText ? newButtonText : (isClicked ? newButtonText : buttonText))
                    .padding(8)
                    .foregroundColor(.white)
            }
            .disabled(!isClickable || (isClicked && !shouldShowNewText))
            .background(isClicked || shouldShowNewText ? Color.green : Color.blue)
            .clipShape(Capsule())
            .padding(10)
        }
        .background(Color.gray)
    }
}

#Preview {
    OnbardingSecond()
}
