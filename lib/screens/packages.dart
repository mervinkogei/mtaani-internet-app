import 'package:flutter/material.dart';
import 'package:poa_internet/utils/defaultValues.dart';

class Packages extends StatefulWidget {
  Packages({Key? key}) : super(key: key);

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> with  SingleTickerProviderStateMixin {
late TabController _tabController;
@override
  void initState() {
     _tabController = TabController(length: 2, vsync: this);

_tabController.addListener(_handleTabSelection);
   
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  bool isSelect = false;

  List packageList =[
    packageItems( isActive: true, mbpsTitle: '10', title: '10MBPS HOME NEW', totalAmount: '2,300', color: Colors.redAccent),
    packageItems( isActive: false, mbpsTitle: '15', title: '15MBPS HOME NEW', totalAmount: '2,900', color: Colors.orange),
    packageItems( isActive: false, mbpsTitle: '5', title: '5MBPS BUSINESS', totalAmount: '3,500', color: Colors.blueAccent),
    packageItems( isActive: false, mbpsTitle: '20', title: '20MBPS HOME NEW', totalAmount: '3,500', color: Colors.lightGreen),
    packageItems( isActive: false, mbpsTitle: '30', title: '30MBPS HOME NEW', totalAmount: '4,500', color: Colors.deepOrangeAccent),
    packageItems( isActive: false, mbpsTitle: '40', title: '40MBPS HOME NEW', totalAmount: '6,500', color: Colors.purple),
    packageItems( isActive: false, mbpsTitle: '80', title: '80MBPS HOME NEW', totalAmount: '12,000', color: Colors.purple),
    packageItems( isActive: false, mbpsTitle: '30', title: '80MBPS BUSINESS', totalAmount: '21,000', color: Colors.purple),
    ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Packages'),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Container(
                color: Theme.of(context).backgroundColor,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(5),
                  labelColor: Colors.white,
                  indicatorWeight: 4,
                  tabs: const [
                    Tab(text: "HOME PACKAGES",),
                    Tab(text: "BUSINESS PACKAGES"),                    
                  ],
                ),
              ),
              Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(                  
                   margin: const EdgeInsets.only(top:15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(   
                    color: Colors.white,                 
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0)
                ),
                  ),
                  child: Center(
                      child: [
                    
                    Container(
                      height: MediaQuery.of(context).size.height * 0.708,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: packageList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Card(
                                    shape: RoundedRectangleBorder( 
                                      borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.grey,
                                      width: 1
                                    ),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  surfaceTintColor: Colors.grey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:Text(packageList[index].title, style: TextStyle(color: packageList[index].color)),
                                          ),
                                          const Spacer(),
                                          packageList[index].isActive ? Text("ACTIVE", style: TextStyle(color: packageList[index].color),) : Text("SELECT", style: TextStyle(color: packageList[index].color)) ,
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: packageList[index].isActive ? Icon(Icons.check_circle_outline_rounded, color: packageList[index].color,) : Icon(Icons.arrow_forward_ios_rounded, color: packageList[index].color,),
                                          )
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(packageList[index].mbpsTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: packageList[index].color),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text("Mbps"),
                                                Text("for 30 days"),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Ksh ${packageList[index].totalAmount}'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                            
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.708,
                      child: Center(
                        child: Column(
                          children: [
                           const SizedBox(height: 50,),
                            Image.asset('images/no_wifi.png', width: 100,),
                            const Text("Network Error", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                            const SizedBox(height: 20),
                            const Text('Please connect to the internet'),
                            const SizedBox(height: 20),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).backgroundColor
                            ),
                            onPressed: (){}, child: const Text("Try Again"))
                          ],
                        ),
                      ),
                    )
                  ][_tabController.index]),
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}