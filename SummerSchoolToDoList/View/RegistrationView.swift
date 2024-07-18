import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                SecureField("Confirm the password", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: {
                    if validateForm() {
                        appViewModel.isLogin = true
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        alertMessage = "Registration was successful!"
                        showAlert = true
                    }
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Registration")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Registration"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func validateForm() -> Bool {
        if name.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            alertMessage = "Please fill in all the fields."
            showAlert = true
            return false
        }

        if password != confirmPassword {
            alertMessage = "The passwords don't match."
            showAlert = true
            return false
        }

        return true
    }
}

#Preview {
    RegistrationView()
}
