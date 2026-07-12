import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
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
                
//                VStack{
//                    Image("cityimage")
//                }.frame(height: 20, maxWidth: .infinity)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    HomeView()
}
