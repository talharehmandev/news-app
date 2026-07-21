import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            // STEP 1: Put the ScrollView at the VERY TOP so everything scrolls together!
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack{
                        Text("Top Stories")
                            .font(.system(size: 24,weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Button(
                            action: {
                             print("View All Taped")
                            }
                        ){
                            Text("View All")
                                .foregroundColor(AppColors.PrimaryColor)
                        }
                        
                    }.padding(.top, 24)
                        .padding(.bottom, 12)

                    VStack(alignment: .leading, spacing: 8) {
                        Image("cityimage")
                            .resizable()
                            .scaledToFit()
                        
                        Text("The Future of Urban Living: How Megacities are Adapting")
                            .font(.system(size: 20,weight: .bold))
                            .padding(.horizontal, 12)
                        
                        Text("Exploring the integration of sustainable energy and autonomous transit in the heart")
                            .font(.system(size: 16,weight: .light))
                            .padding(.horizontal, 12)
                        
                        HStack{
                            Text("4 min read • 2h ago")
                                .font(.system(size: 15))
                            Spacer()
                            Button(
                                action:{
                                    print("Share")
                                }
                            ){Image(systemName: "paperplane").foregroundColor(.red)
                            }}.padding()
                    }
                    .background(Color.gray.opacity(0.3)) // Making it look a bit nicer
                    .cornerRadius(20).padding(.bottom, 15)
                    
                    
                    // STEP 2: The LazyVStack still handles efficiently loading the items
                    LazyVStack(spacing: 12) {
                        
                        // STEP 3: Use ForEach to create a loop (like builder in Flutter)
                        // Here we are creating 5 dummy items (0 to 4)
                        ForEach(0..<5, id: \.self) { index in
                            
                            // STEP 4: Your custom UI card goes inside the ForEach
                            HStack(spacing: 16) {
                                Image("techimg")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 80)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text("Tech")
                                        .font(.title2)
                                    Text("Quantum Computing Reaches New Stability Milestone")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(8)
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(12)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
           
        }
    }
}

#Preview {
    HomeView()
}
