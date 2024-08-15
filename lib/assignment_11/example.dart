import 'package:calculator/assignment_11/infotext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    ),
  );
}

 // Splash screen -------------------------------------
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
            colors: [Colors.deepOrange, Colors.purple],
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/tech.jpg'),
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
 // Data class --------------------------------------------------
class TileInfo{
  String name;
  String image;
  String text;
  String link;
  TileInfo({required this.name, required this.image, required this.text, required this.link}) ;
}
InfoText infoText = InfoText();
    List<TileInfo> items = [
      TileInfo(name: "Microsoft", image: 'assets/icons/microsoft.jpg', text: infoText.microsoft, link: ''),
      TileInfo(name: "Nvidia", image: 'assets/icons/nvidia.jpg', text: infoText.nvidia, link: ''),
      TileInfo(name: "Apple", image: 'assets/icons/apple.jpg', text: infoText.apple, link: ''),
      TileInfo(name: "Google", image: 'assets/icons/google.jpg', text: infoText.google, link: ''),
      TileInfo(name: "Amazon", image: 'assets/icons/amazon.jpg', text: infoText.amazon, link: ''),
      TileInfo(name: "Facebook", image: 'assets/icons/facebook.jpg', text: infoText.facebook, link: ''),
      TileInfo(name: "TSMC", image: 'assets/icons/tsmc.jpg', text: infoText.tsmc, link: ''),
      TileInfo(name: "Broadcom", image: 'assets/icons/broadcom.jpg', text: infoText.broadcom, link: ''),
      TileInfo(name: "Tesla", image: 'assets/icons/tesla.jpg', text: infoText.tesla, link: ''),
      TileInfo(name: "Tencent", image: 'assets/icons/tencent.jpg', text: infoText.tencent, link: ''),
    ];

    // Main page -----------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple[500],
        title: Text("Top Ten Tech Companies"),
        actions: [
          PopupMenuButton(
            color: Colors.white,
            onSelected: (String choice){
              if(choice == 'Share the app'){
                Share.share('Check out this amazing app!');
              }else if(choice == 'About'){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Top Ten Tech Companies",
                      style: TextStyle(fontFamily: 'BodoniModa'),),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(infoText.about)
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
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
              tileColor: Colors.deepOrange[400],
              title: Text(items[index].name),
              onTap: () {},
              hoverColor: Colors.blue[100],
              minLeadingWidth: 60,
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                        DetailPage(companyName: items[index].name, image1: items[index].image, text1: items[index].text, url: 'https://www.bing.com/search?q=top+tech+company&cvid=2b054260324244e3a731cd2b8bc807fe&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCTExNTMwajBqMagCA7ACAQ&FORM=ANAB01&PC=U531'),
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
// Details page ------------------------------------------
class DetailPage extends StatefulWidget {
  final String url;
  final String text1;
  final String companyName;
  final String image1;

  const DetailPage({
    super.key,
    required this.companyName,
    required this.image1,
    required this.text1,
    required this.url,
  });
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(widget.companyName),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[500],
              ),
                onPressed: () async {
                if(await canLaunchUrl(Uri.parse(widget.url))){
                  await launchUrl(Uri.parse(widget.url));
                }else{
                  throw 'could not launch ${widget.url}';
                }
                },
                child: Text('More Details',
                style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
