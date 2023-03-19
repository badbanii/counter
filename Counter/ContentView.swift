import SwiftUI

struct ContentView: View {
    @StateObject var navigationStack = NavigationStack(ViewScreen.splash)
    
    var body: some View {
        VStack {
            switch navigationStack.currentScreen {
            case .splash:
                SplashScreen()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            navigationStack.advance(to: .main)
                        }
                    })
            case .main:
                MainScreen()
            }
        }
        .environmentObject(navigationStack)
    }
}
struct SplashScreen: View {
    var body: some View {
        VStack{
            Text("Loading...")
                .foregroundColor(Color.yellow)
                .font(.system(size: 36))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Made by tuly")
                .foregroundColor(Color.yellow)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity)
                .padding(20)
        }.background(Color.indigo)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainScreen: View {
    @StateObject var viewmodel=CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
        
            Text("Counter")
                .font(.largeTitle)
            
            Text("\(viewmodel.count)")
                .font(.title)
            
            HStack(spacing: 40) {
                Button(action: viewmodel.increment) {
                    Text("Increment")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: viewmodel.decrement) {
                    Text("Decrement")
                        .font(.title2)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.background(Color.indigo)
        }.background(Color.indigo)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
