import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'dart:convert';
import 'common_functions.dart';
import 'custom_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductDetail extends StatefulWidget {
  String productid='';
  ProductDetail(String productid)
  {
      this.productid=productid;
  }
  @override
  State<ProductDetail> createState() => _ProductDetailState(productid);
}

class _ProductDetailState extends State<ProductDetail> {
  String productid='';
  String categorytitle='',id='',title='',price='',stock='',weight='',size='',photo='',islive='',detail='';
  var storage = new FlutterSecureStorage();
  _ProductDetailState(String productid)
  {
      this.productid = productid;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchProductDetailFromServer();
  }

  Future<void> FetchProductDetailFromServer() async
  {
    // api call
    String ApiAddress = Common.getBase() + "?productid=$productid";
    print(ApiAddress);
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    //convert it into json
    var data = json.decode(response.body);
    //create variable to store error detail
    String error = data[0]['error'];
    if(error !='no') // there is an error
    {
        toast(error);
    }
    else if(data[1]['total']==0)
    {
      toast('no product detail found');
    }
    else
    {
        setState(() {
          title = data[2]['title'];
          categorytitle = data[2]['categorytitle'];
          price = data[2]['price'];
          weight = data[2]['weight'];
          size = data[2]['size'];
          stock = data[2]['stock'];
          detail = data[2]['detail'];
          islive = data[2]['islive'];
          photo = data[2]['photo'];
          sampleImages.insert(0, "http://dholerasmartcities.in/shop/flutter_php/images/product/" + photo);
        });
    }
  }

   List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FanCarouselImageSlider(
              imagesLink: sampleImages,
              isAssets: false,
              autoPlay: true,
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(title,Colors.black,30),
                  MyText("Rs " + price,Colors.black,25),
                  MyText("Quantity " + stock,Colors.black),
                  MyText("Weight " + weight,Colors.black),
                  MyText("Size " + size,Colors.black),
                  Text(detail,style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16
                    ),
                  ),
                    maxLines: 3,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 20),
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      //call api to add product into cart
                      print("AddtoCart called....");
                      AddtoCart();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(child: CircleAvatar(child: Image.asset("assets/shopping-cart.png",height: 40,),minRadius: 40,)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //call api to add product into wishlist
                      print("AddtoWishList called....");
                      AddtoWishList();
                    },
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(child:CircleAvatar(child: Image.asset("assets/favourite.png",height: 30,),minRadius: 25,maxRadius: 25,),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void AddtoCart() {
    storage.read(key: "userid").then((value){
      print("AddtoCart value will be fetched from storage");
        String apiAddress = Common.getBase() + "add_to_cart.php?productid=$productid&usersid=$value";
        SendRequest(apiAddress);
      });
  }
  void AddtoWishList() {
    print("AddTowishlist value will be fetched from storage");
    storage.read(key: "userid").then((value){
      String apiAddress = Common.getBase() + "add_to_wishlist.php?productid=$productid&usersid=$value";
      SendRequest(apiAddress);
    });
  }
  Future<void> SendRequest(String apiAddress) async
  {
      print(apiAddress);
      var response = await http.get(Uri.parse(apiAddress));
      print(response.body);
      //convert it to json
      var data = json.decode(response.body);
      //create error variable
      String error = data[0]['error'];
      if(error !='no')
      {
          toast(error);
      }
      else
      {
          String message = data[1]['message'];
          toast(message);
      }
  }
}
