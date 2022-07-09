import SwiftUI

struct ContentView: View {
    @State private var product = Product(name: "", description: "", code: "", price: 0.0)
    
    @State private var isValidCode = true
    @State private var isProductSaved = false
    
    private func saveProduct(){
        isValidCode = product.code.count >= 5
        isProductSaved = isValidCode
    }
    
    var body: some View {
        Form {
            Section(header: Text("Product")) {
                VStack(alignment: .leading){
                    Text("Name:")
                    TextField("Enter the name", text: $product.name)
                }
                VStack(alignment: .leading) {
                    Text("Description:")
                    TextField("Enter the description", text: $product.description)
                }
                VStack(alignment: .leading) {
                    Text("Code:")
                    HStack {
                        TextField("Enter the code", text: $product.description)
                        if (!self.isValidCode) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section {
                Button(action: saveProduct) {
                    Text("Save")
                }
            }
            
            if(self.isProductSaved) {
                ProductSavedView(product: self.product)
            }
            
        }
    }
}

struct ProductSavedView: View{
    var product: Product
    
    var body: some View {
        Section {
            Text("Name: \(product.name)")
            Text("Description: \(product.description)")
            Text("Code: \(product.code)")
            Text("Price: \(product.price)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
