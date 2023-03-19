import SwiftUI
import Combine

class CounterViewModel:ObservableObject{
    @Published var count=0
    
    func increment()
    {
        count+=1
    }
    
    func decrement()
    {
        count-=1
    }
}
