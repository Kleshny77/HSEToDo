import SwiftUI

@main
struct SwiftUIListApp: App {
    @ObservedObject var appViewModel = AppViewModel()
    
    init() {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            appViewModel.isLogin = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if appViewModel.isLogin {
                TodoListView().environmentObject(TodoListViewModel())
                    .environmentObject(appViewModel)
            } else {
                RegistrationView()
                    .environmentObject(appViewModel)
            }
        }
    }
}
