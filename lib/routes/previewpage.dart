import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plantdisease/utils/styles.dart';
import 'package:plantdisease/utils/dots.dart';

class Previewpage extends StatefulWidget {
  const Previewpage({Key? key}) : super(key: key);

  @override
  _PreviewpageState createState() => _PreviewpageState();
}

class _PreviewpageState extends State<Previewpage> {
  PageController pc = PageController(initialPage: 0);
  bool? isDone = false;

  @override
  /*void initState() {
    // TODO: implement initState
    super.initState();
    _loadPage();
  }
  _loadPage() async{
    return checkSeen();
  }
  Future checkSeen() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _isDone = (prefs.getBool('tutorial_seen') ?? false);
    if(_isDone)
    {
      Navigator.pushNamed(context, '/homepage');
    }
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          firstPage(),
          secondPage(),
          thirdPage(context, pc),
        ],
      ),
    );
  }
}
List<Widget> dotWidgetFunction(int currentPage)
{
  return <Widget> [
    for(int i = 0 ; i < 3 ; i++)
      if(i == currentPage -1 )
        Dots(bigSmall: dotSize.Big,)
      else
        Dots(bigSmall: dotSize.Small,)
  ];
}
Widget firstPage()
{
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/df/d2/55/dfd255d408ee93c7b06de75696452cc0.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Column(
            children: [
              Center(
                child: Text(
                  "Welcome to",
                  style: TextStyle(color: Colors.lightGreen[800], fontSize: 30,),
                ),
              ),
              Center(
                child: Text(
                  "Disease Identifier",
                  style: plantAppStyleBig,
                ),
              ),
            ],
          ),
          Text(
            "With this application, you have the opportunity to detect the diseases of your plants.",
            style: TextStyle(color: Colors.lightGreen[800], fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dotWidgetFunction(1),
          ),
          const SizedBox(height: 40,)

        ]
    ),
  );
}
Widget secondPage()
{
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/a0/7e/bd/a07ebd32b489dcf01905f35d0f73b306.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(24.0, 270.0, 24.0, 24.0),
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.search),
              Text(
                "find disease",
                style: TextStyle(color: Color(0xF579063B), fontSize: 26),
              )
            ],
          ),
          const Divider(thickness: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 7, 0),
                child: Text(
                  "get info about disease",
                  style: TextStyle(color: Color(0xFF558B2F), fontSize: 26),

                ),
              ),
            ],
          ),


          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dotWidgetFunction(2),
          ),
          const SizedBox(height: 135),
        ],
      ),
    ),
  );
}

makeSeen() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('tutorial_seen', true);

}
Widget thirdPage(BuildContext context, PageController pc)
{
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/69/c1/ed/69c1ed31bb46b7f66fb2f9876cf922a0.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Disease Identifier",
              style: plantAppStyleBig,
            ),
          ),


          Padding(
              padding: EdgeInsets.all(24.0),
              child:
              SizedBox(width: 50.0,),

          ),
          Center(
            child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(
                  primary: Color(0xF579063B),
                  fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                ),

                onPressed: ()
                {
                  pc.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.restart_alt),
                label: const Text("First Page")
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
          ),
          Center(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF558B2F),
                  fixedSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),

                onPressed: ()
                {
                  makeSeen();
                  Navigator.pushNamed(context, '/homepage');
                },
                icon: const Icon(Icons.check),
                label: const Text("Finish")
            ),
          ),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dotWidgetFunction(3),
          ),
          const SizedBox(height: 160)
        ]
    ),
  );
}