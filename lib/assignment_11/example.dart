import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    ),
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

class TileInfo{
  String name;
  String image;
  String text;
  TileInfo({required this.name, required this.image, required this.text}) ;
}
    List<TileInfo> items = [
      TileInfo(name: "Microsoft", image: 'assets/icons/microsoft.jpg', text: 'Microsoft Corporation is an American multinational technology company that has been a key player in the computer industry since its founding in 1975. Headquartered in Redmond, Washington, Microsoft initially gained dominance in the operating systems market during the 1980s and 90s with MS-DOS and Windows'),
      TileInfo(name: "Nvidia", image: 'assets/icons/nvidia.jpg', text: ''),
      TileInfo(name: "Apple", image: 'assets/icons/apple.jpg', text: ''),
      TileInfo(name: "Google", image: 'assets/icons/google.jpg', text: ''),
      TileInfo(name: "Amazon", image: 'assets/icons/amazon.jpg', text: ''),
      TileInfo(name: "Facebook", image: 'assets/icons/facebook.jpg', text: ''),
      TileInfo(name: "TSMC", image: 'assets/icons/tsmc.jpg', text: ''),
      TileInfo(name: "Broadcom", image: 'assets/icons/broadcom.jpg', text: ''),
      TileInfo(name: "Tesla", image: 'assets/icons/tesla.jpg', text: ''),
      TileInfo(name: "Tencent", image: 'assets/icons/tencent.jpg', text: ''),
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
            onSelected: (String choice){
              if(choice == 'Share the app'){
                Share.share('Check out this amazing app!');
              }else if(choice == 'About'){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("information about the app"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text('This application is developed by Naieb Yousefi')
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text('Close'))
                      ],
                    );
                  }
                );
              }else if(choice == 'Exit'){
                SystemNavigator.pop();
              }
            },
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
           }),
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
              leading: CircleAvatar(
                backgroundImage: AssetImage(items[index].image),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              tileColor: Colors.pink[100],
              title: Text(items[index].name),
              onTap: () {},
              hoverColor: Colors.blue[200],
              minLeadingWidth: 60,
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                        DetailPage(companyName: items[index].name, image1: items[index].image,text1: items[index].text,
                      ),
                    ),
                  );
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
  final String text1;
  final String companyName;
  final String image1;
   const DetailPage({super.key, required this.companyName, required this.image1, required this.text1});

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
                widget.text1,
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
