import 'package:api_demo2_model_class/api/api-connection.dart';
import 'package:api_demo2_model_class/models/model.dart';
import 'package:flutter/material.dart';

import 'dialgoue-box.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User resp;
  List results;

  Future getApiLists() async {
    print("Inside Function ");
    resp = await getDatas();
    print("_____________________INSIDEEEEEEEEEEEEEEEEEEEEEDE "+resp.data[1].email.toString());

    if(resp.data.isNotEmpty){
      setState((){
        results = resp.data;
      });
    }
    // results = resp["data"];
    // setState(())
    print("Results ____________________________$results");
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiLists();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Integration with Model"),
        leading: Icon(Icons.home,size: 30,),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: IconButton(
              icon: Icon(Icons.settings,size: 30,color: Colors.white,),
              onPressed: (){
                print("Tapped");
                showDialog(context: context,builder: (BuildContext context){
                  return   DBox();

                });
              },
            )
          )
        ],
        centerTitle: true,
        // elevation: 50,
        // shape: RoundedRectangleBorder(
        //   side: BorderSide.none,
        //   borderRadius: BorderRadius.horizontal(right: Radius.circular(50))
        // ),
      ),
      body: resp==null?CircularProgressIndicator():


      SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //     width: 400,
            //     height: 200,
            //     color: Colors.white10,
            //     child: IconButton(
            //       color: Colors.blue,
            //       icon: Icon(
            //         Icons.account_circle,
            //         size: 40,
            //       ),
            //       onPressed: () {
            //         // getDatas();
            //       },
            //     )),
            ListView.builder(
                physics: ScrollPhysics(),
                itemCount: resp.data == null ? 0 : resp.data.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      color: Colors.white,
                      elevation: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text("Helllo"),
                          Container(
                              width: 200,
                              height: 100,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(resp.data[index].avatar,)
                                  )
                              )
                          ),
                          Text(resp.data[index].firstName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text(resp.data[index].lastName , style: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 12),),
                          Text(resp.data[index].email, style: TextStyle(fontWeight: FontWeight.w300 ),)

                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      )


    );
  }
}
