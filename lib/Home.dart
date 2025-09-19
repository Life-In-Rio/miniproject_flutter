// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// class Homedart extends StatelessWidget {
//   const Homedart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purpleAccent,
//        title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: [
//            Text("AmbakuStore",
//              style: GoogleFonts.poppins(
//              color: Colors.white,
//              fontSize: 20,
//              fontWeight: FontWeight.bold
//            ),
//            ),
//            Icon(MdiIcons.cartOutline,color: Colors.white,)
//          ],

//        ),
//       ),
//            body: ListView(
//         children: [
//           SizedBox(height: 10,),
//                   Text("Promo Hari ini",
//                     style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.black87
//                   )),
//           Padding(
//             padding: const EdgeInsets.all(0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   SizedBox(width: 10,),
//                   Container(
//                     child: Text("Discount 50%",),
//                     height: 100,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.circular(10)  
//                     )),
//                     SizedBox(width: 10,),
//                   Container(
//                     child: Text("Product Baru",),
//                     height: 100,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.circular(10)
//                     )),
//                     SizedBox(width: 10,),
//                   Container(
//                     child: Text("Muwani Everyday"),
//                     height: 100,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.circular(10)  
//                     )),
//                     SizedBox(width: 10,),
//                 ],
//               ),
              
//             ),
            
//           ),  
          
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Homedart extends StatelessWidget {
  const Homedart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "AmbakuStore",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              MdiIcons.cartOutline,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text(
            "Promo Hari Ini",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _promoCard("Discount 50%"),
                _promoCard("Product Baru"),
                _promoCard("Muwani Everyday"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Semua Product",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          // grid product
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.7, // biar lebih tinggi
            children: [
              _productCard("Keripik Usus", "assets/ff.jpg", "Sale", "Rp 20.000"),
              _productCard("Basreng Pedes", "assets/ib.jpg", "New", "Rp 25.000"),
              _productCard("Keripik Paru", "assets/tk.jpg", "Hot", "Rp 30.000"),
              _productCard("Pilus Hot Melewot", "assets/po.jpg", "Best", "Rp 50.000"),
              _productCard("Pisang Centil", "assets/ww.jpg", "New", "43.000"),
              _productCard("Kerupuk Kulit", "assets/sd.jpg", "Best", "Rp 21.000"),
            ],
          ),
        ],
      ),
    );
  }

  // Widget khusus untuk card promo
  Widget _promoCard(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Widget card product dengan Stack + harga + tombol
  Widget _productCard(String name, String imagePath, String label, String price) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // gambar produk
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              // nama produk
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // harga produk
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 6),
                child: Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              // tombol beli + ikon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Beli",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(MdiIcons.cartPlus, color: Colors.purpleAccent),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // Label promo di pojok kiri atas
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

