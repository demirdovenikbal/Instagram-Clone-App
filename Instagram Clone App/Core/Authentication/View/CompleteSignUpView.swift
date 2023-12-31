//
//  CompleteSignUpView.swift
//  Instagram Clone App
//
//  Created by Ikbal Demirdoven on 2023-11-11.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegistrationViewModel
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            Text("Click below to complete registration and start using Instagram.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 44)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CompleteSignUpView()
}
