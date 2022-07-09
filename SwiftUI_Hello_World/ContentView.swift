import SwiftUI

struct ContentView: View {
    //state variables will automactically update the screen
    //when their values are updated
    @State private var text: String = "Hello, Rodrigo"
    @State private var show = true
    
    var body: some View {
        
        VStack {
            Text(text)
                .padding()
                .foregroundColor(.black)
            Button("Click me") {
                text = "Button clicked"
                show.toggle()
            }
            
            if(show) {
                Text("Teste")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
