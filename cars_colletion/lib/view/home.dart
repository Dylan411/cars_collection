import 'package:cars_colletion/service/carAPI.dart';
import 'package:cars_colletion/view/user/auth/accessUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cars.dart';
import 'car/global/showCars.dart';
import 'car/user/showCarsCollection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user = '';

  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences name = await SharedPreferences.getInstance();
    setState(() {
      user = name.getString('user')!;
      print('userInit:' + user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(28, 33, 46, 1.0),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(61, 72, 92, 1.0),
                height: 120.0,
                child: Padding(
                  padding: EdgeInsets.only(right: 18.0, left: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.account_circle),
                              iconSize: 35,
                              color: Colors.white,
                              onPressed: () async {
                                SharedPreferences name =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  name.setString('user', '');
                                  user = name.getString('user')!;
                                  print(name);
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Garage',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 7.0, 5.0, 7.0),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            color: Color.fromRGBO(83, 97, 125, 1.0),
                            boxShadow: [BoxShadow(color: Colors.black26)]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey[350]?.withOpacity(0.3),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    left: -12.0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey[350]?.withOpacity(0.3),
                                )),
                            style: TextStyle(
                              color: Colors.grey[350]?.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: Stack(
                  children: <Widget>[
                    ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp4045023.jpg',
                            'Acura'),
                        Buildcircle(
                            'https://www.motortrend.com/uploads/sites/5/2020/05/Alfa-Romeo-Logo-Badge-1910-1915-1.jpg?interpolation=lanczos-none&fit=around|660:371',
                            'Alfa Romeo'),
                        Buildcircle(
                            'https://e1.pxfuel.com/desktop-wallpaper/765/669/desktop-wallpaper-wayne-lister-aston-martin-logo-phone-thumbnail.jpg',
                            'Aston Martin'),
                        Buildcircle(
                            'https://www.hdwallpaper.nu/wp-content/uploads/2015/12/audi-logo-wallpaper-547.jpg',
                            'Audi'),
                        Buildcircle(
                            'https://d2t1xqejof9utc.cloudfront.net/screenshots/pics/b3daebdc23bbfeb47a059d7e312718dd/large.png',
                            'Bentley'),
                        Buildcircle(
                            'https://www.pngitem.com/pimgs/m/390-3909578_bmw-logo-bmw-logo-high-resolution-hd-png.png',
                            'BMW'),
                        Buildcircle(
                            'https://www.pngitem.com/pimgs/m/477-4771781_buick-logo-hd-png-download.png',
                            'Buick'),
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp4044850.jpg',
                            'Cadillac'),
                        Buildcircle(
                            'https://cdn.wallpapersafari.com/71/92/XrolY1.jpg',
                            'Chevrolet'),
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp4044907.jpg',
                            'Chrysler'),
                        Buildcircle(
                            'https://www.pngitem.com/pimgs/m/46-462910_story-of-citroen-citroen-car-logo-png-transparent.png',
                            'Citroen'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/f3/07/ed/f307edfe7e4316f24b1bda8ceb81d861.jpg',
                            'Dacia'),
                        Buildcircle(
                            'https://logosandtypes.com/wp-content/uploads/2020/06/Daihatsu.png',
                            'Daihatsu'),
                        Buildcircle(
                            'https://www.pngitem.com/pimgs/m/12-122670_datsun-logo-datsun-logo-png-transparent-png.png',
                            'Datsun'),
                        Buildcircle(
                            'https://1000logos.net/wp-content/uploads/2018/04/Emblem-Dodge.jpg',
                            'Dodge'),
                        Buildcircle(
                            'https://cdn.wallpapersafari.com/23/40/GD3vuW.jpg',
                            'Ferrari'),
                        Buildcircle(
                            'https://thumbs.dreamstime.com/b/fiat-logo-editorial-ilustrativo-sobre-fondo-blanco-eps-descargar-vector-jpeg-banner-208329300.jpg',
                            'Fiat'),
                        Buildcircle(
                            'https://cdn.wallpapersafari.com/77/65/n14GXK.jpg',
                            'Ford'),
                        Buildcircle(
                            'https://e0.pxfuel.com/wallpapers/386/687/desktop-wallpaper-genesis-logo-thumbnail.jpg',
                            'Genesis'),
                        Buildcircle(
                            'https://thumbs.dreamstime.com/b/logo-gmc-car-color-vector-format-aviable-ai-logo-gmc-124804065.jpg',
                            'GMC'),
                        Buildcircle(
                            'https://thumbs.dreamstime.com/b/web-183281772.jpg',
                            'Honda'),
                        Buildcircle(
                            'https://thumbs.dreamstime.com/z/logo-hummer-logo-hummer-car-color-vector-format-aviable-ai-124804159.jpg',
                            'Hummer'),
                        Buildcircle(
                            'https://car-brand-names.com/wp-content/uploads/2016/01/Hyundai-Logo.jpg',
                            'Hyundai'),
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp4045362.jpg',
                            'Infiniti'),
                        Buildcircle(
                            'https://www.pngkit.com/png/full/962-9624914_jaguar-logo-emblem-jaguar-logo.png',
                            'Jaguar'),
                        Buildcircle(
                            'https://www.nicepng.com/png/full/428-4286887_jeep-logo-vector-free-download-vector-jeep-logo.png',
                            'Jeep'),
                        Buildcircle(
                            'https://e0.pxfuel.com/wallpapers/568/68/desktop-wallpaper-kia-logo-thumbnail.jpg',
                            'Kia'),
                        Buildcircle(
                            'https://1000marcas.net/wp-content/uploads/2020/10/Lada-Logo-1993.jpg',
                            'Lada'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/e9/6e/72/e96e7231f606cad097340139eb41fa14.jpg',
                            'Land Rover'),
                        Buildcircle(
                            'https://www.hdwallpaper.nu/wp-content/uploads/2015/12/Lexus-Logo-Wallpaper-2022.png',
                            'Lexus'),
                        Buildcircle(
                            'https://e0.pxfuel.com/wallpapers/518/592/desktop-wallpaper-checking-out-the-lincoln-warranty-lincoln-logo-thumbnail.jpg',
                            'Lincoln'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Lotus-logo-3000x3000.png',
                            'Lotus'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/90/e8/b2/90e8b27cedf00abb309a50d15db1b009.jpg',
                            'Maserati'),
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp3105178.jpg',
                            'Mazda'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/2d/3b/54/2d3b5459e7bc6eefd6361685601290a4.jpg',
                            'Mercedes Benz'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Mini-logo-2001-1920x1080.png',
                            'Mini'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/c7/ae/00/c7ae0041fc00f16c53773febbcac416d.jpg',
                            'Mitsubishi'),
                        Buildcircle(
                            'https://www.carlogos.org/car-logos/nissan-logo-2013-700x700.png',
                            'Nissan'),
                        Buildcircle(
                            'https://thumbs.dreamstime.com/z/logo-opel-logo-opel-car-color-vector-format-aviable-ai-124400548.jpg',
                            'Opel'),
                        Buildcircle(
                            'https://wallpapercave.com/wp/wp4045713.png',
                            'Peugeot'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Plymouth-logo-1920x1080.png',
                            'Plymouth'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Pontiac-logo-2560x1440.png',
                            'Pontiac'),
                        Buildcircle(
                            'https://p4.wallpaperbetter.com/wallpaper/924/170/430/5996-porsche-logo-1920x1080-car-wallpaper-preview.jpg',
                            'Porsche'),
                        Buildcircle(
                            'https://i.pinimg.com/originals/c6/29/e5/c629e56f460b8f3242ef195a78e4397a.jpg',
                            'Renault'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Rolls-Royce-logo-2048x2048.png',
                            'Rolls Royce'),
                        Buildcircle(
                            'https://www.pngkey.com/png/detail/439-4391960_subaru-logo.png',
                            'Subaru'),
                        Buildcircle(
                            'https://www.pngitem.com/pimgs/m/90-906448_tesla-motors-logo-tesla-motors-hd-png-download.png',
                            'Tesla'),
                        Buildcircle(
                            'https://www.carlogos.org/car-logos/toyota-logo-2019-1350x1500.png',
                            'Toyota'),
                        Buildcircle(
                            'https://www.freepnglogos.com/uploads/vw-png-logo/pulman-volkswagen-new-pulman-motor-group-png-logo-3.png',
                            'Volkswagen'),
                        Buildcircle(
                            'https://www.carlogos.org/logo/Volvo-logo-2014-1920x1080.png',
                            'Volvo'),
                      ],
                    ),
                    //gradient in end of list effect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Opacity(
                          opacity: 0.03,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(360 / 360),
                            child: Image.network(
                                'http://samaritan-counseling.com/wp-content/themes/Stellar_Responsive/images/right-fade.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "New cars",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.normal),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const ShowCars())));
                                }),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FutureBuilder(
                      future: Api.getCar(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Cars> data = snapshot.data;
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Buildcard(data[1].image, data[1].modelName,
                                      data[1].year.toString()),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Buildcard(data[2].image, data[2].modelName,
                                      data[2].year.toString()),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Buildcard(data[3].image, data[3].modelName,
                                      data[3].year.toString()),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                ],
                              ));
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Editions",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "More",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 220.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Buildcard(
                              'https://www.pngarts.com/files/1/Porsche-PNG-Pic.png',
                              '17 Ford GT (2nd Color)',
                              ''),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Buildcard(
                              'https://www.pngarts.com/files/1/Porsche-PNG-Pic.png',
                              'Treasure Hunt',
                              ''),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Buildcard(
                              'https://www.pngarts.com/files/1/Porsche-PNG-Pic.png',
                              'Walmart Edition',
                              ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(user);
            if (user != '') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ShowCarsCollection())));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AccessUser())));
            }
          },
          backgroundColor: Color.fromARGB(255, 28, 35, 51),
          child: const Icon(Icons.car_repair),
        ),
      ),
    );
  }
}

Widget Buildcard(String url, String name, String year) {
  return Container(
    height: 300,
    width: 170,
    decoration: const BoxDecoration(
      color: Color.fromRGBO(61, 72, 92, 1.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 8.0,
        ),
      ],
    ),
    child: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
          child: Image.network(url),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 215.0, right: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: Color.fromRGBO(28, 33, 46, 1.0),
                            fontSize: 15.0,
                            letterSpacing: 1.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 1,
            right: 1,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Icon(Icons.add, color: Colors.grey[350]?.withOpacity(0.3))
                    ],
                  )
                ],
              ),
            ))
      ],
    ),
  );
}

Widget Buildcircle(String url, String name) {
  return Container(
    width: 100.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 70.0,
          width: 70.0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          name,
          style: const TextStyle(color: Color.fromRGBO(67, 76, 88, 1.0)),
        ),
      ],
    ),
  );
}
