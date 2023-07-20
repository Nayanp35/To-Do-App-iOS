import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(angle: 0,
                           background: .blue,
                           title: "To Do List",
                           subtitle: "Get things done")
                
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                            
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding()
                    
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                    TLButton(title: "Log In", gradientLeft: .blue, gradientRight: .purple) {
                        viewModel.login()
                    }
                }
                .padding(20) // Moved this line to be inside the Form's closure
                

                // Create Account
                VStack {
                    Text("New Around Here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .padding() // Adding overall padding to the VStack
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
