import SwiftUI

final class NavigationStack: ObservableObject {
    @Published var viewStack: [ViewScreen] = []
    @Published var currentScreen: ViewScreen
    
    init(_ currentScreen: ViewScreen) {
        self.currentScreen = currentScreen
    }
    
    func back() {
        if viewStack.count == 0 {
            return
        }
        let last = viewStack.count - 1
        currentScreen = viewStack[last]
        viewStack.remove(at: last)
    }
    
    func advance(to newScreen: ViewScreen) {
        viewStack.append(currentScreen)
        currentScreen = newScreen
    }
    
    func home() {
        viewStack.removeAll()
        currentScreen = ViewScreen.splash
    }
}

enum ViewScreen {
    case splash
    case main
}
