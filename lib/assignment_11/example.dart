import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  );
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MyHomePage()),
      );
    });
  }

  void disposed() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Ten Tech Companies",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontFamily: 'BodoniModa',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "V 0.1.1",
              style: TextStyle(
                fontFamily: 'BodoniModa',
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TileInfo {
  String name;
   String image;
  // String text;
  // required this.text
  TileInfo({required this.name, required this.image,});
}
List<TileInfo> items = [
  TileInfo(name: "Microsoft", image: 'assets/icons/microsoft.jpg'),
  TileInfo(name: "Nvidia", image: 'assets/icons/nvidia.jpg'),
  TileInfo(name: "Apple", image: 'assets/icons/apple.jpg'),
  TileInfo(name: "Google", image: 'assets/icons/google.jpg'),
  TileInfo(name: "Amazon", image: 'assets/icons/amazon.jpg'),
  TileInfo(name: "Facebook", image: 'assets/icons/facebook.jpg'),
  TileInfo(name: "TSMC", image: 'assets/icons/tsmc.jpg'),
  TileInfo(name: "Broadcom", image: 'assets/icons/broadcom.jpg'),
  TileInfo(name: "Tesla", image: 'assets/icons/tesla.jpg'),
  TileInfo(name: "Tencent", image: 'assets/icons/tencent.jpg'),
];
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text("Top Ten Tech Companies"),
        actions: [
          PopupMenuButton(
            onSelected: (value){},
            itemBuilder: (BuildContext context){
               return {'Share the app', 'About', 'Exit'}.map((String choice){
                 return PopupMenuItem(
                   value: choice,
                   child: Text(choice),
                 );
               }
               ).toList();
              //  [
             //    PopupMenuItem(
             //      child: ListTile(leading: Text('Share the app'),)),
             //    PopupMenuItem(
             //       child: ListTile(leading: Text('About'),)),
             //    PopupMenuItem(
             //       child: ListTile(
             //         leading: Text('Exit'),
             //         onTap: (){
             //         },
             //      ),),
             // ];
           })
        ],
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              tileColor: Colors.pink[100],
              title: Text(items[index].name),
              onTap: () {},
              hoverColor: Colors.blue[200],
              minLeadingWidth: 30,
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) =>
                        DetailPage(companyName: items[index].name, image1: items[index].image,)));
                  },
                  icon: Icon(Icons.arrow_forward)),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  String companyName;
  String image1;
   DetailPage({super.key, required this.companyName, required this.image1});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent[100],
        title: Text(widget.companyName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(widget.image1,
                height: 200,
                width: double.infinity,
              ),
              SizedBox(height: 10,),
              Text(
                ' hi dear',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('More Details'))
            ],
          ),
        ),
      ),
    );
  }
}
