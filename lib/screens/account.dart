import 'package:flutter/material.dart';
import 'package:poa_internet/utils/defaultValues.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  List accountList =[
    accountItems(icons: Icon(Icons.person), title: "Username", accountDetails: "Vincent Kogei"),
    accountItems(icons: Icon(Icons.email), title: "Email", accountDetails: "vincentkogei@gmail.com"),
    accountItems(icons: Icon(Icons.phone), title: "Phone Number", accountDetails: "0713175969"),
    accountItems(icons: Icon(Icons.card_travel_sharp), title: "Account Number", accountDetails: "VGG002372"),
    accountItems(icons: Icon(Icons.location_pin), title: "Address", accountDetails: "Mambuzi Area"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [          
          Container(
            height: MediaQuery.of(context).size.height * 0.735,
            width: MediaQuery.of(context).size.width,
             margin: const EdgeInsets.only(top:100.0),
                  padding:  const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(   
                    color: Colors.white,                 
                    border: Border.all(color: Colors.white, width: 4),
                    // borderRadius: const BorderRadius.only(
                    // topRight: Radius.circular(0.0),
                    // topLeft: Radius.circular(0.0)
                // ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(                      
                      children: [
                        SizedBox(height: 120),
                        Container(
                            child: Card(
                              shape: RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                color: Colors.grey, width: 0.7,),
                              ),
                              color: Colors.white,
                              child: SizedBox(
                                width: 300,
                                height: 330,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),   
                                   ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: accountList.length,
                                    itemBuilder: (context, index){
                                    return  Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                          minLeadingWidth: 10,
                                          minVerticalPadding: 10,
                                          dense: true,
                                          leading: accountList[index].icons,                                      
                                          trailing: Text(accountList[index].accountDetails, style: TextStyle(color: Colors.grey),),
                                          title: Text(accountList[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Italic"),),
                                        ),                                     
                                        Divider()
                                      ],
                                    );
                                   })                               
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),  
                           Container(
                            child: Card(
                              shape: RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                color: Colors.grey, width: 0.7,),
                              ),
                              color: Colors.white,
                              child: SizedBox(
                                width: 300,
                                height: 150,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10), 
                                    Text("TOP UP (Safaricom Paybill)", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),), 
                                    const Divider(), 
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Business No."),
                                        ),
                                        Spacer(),                                        
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text("2346699"),
                                        )
                                      ],
                                    ),
                                    const Divider(), 
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Account No."),
                                        ),
                                        Spacer(),                                        
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text("VGG002372"),
                                        )
                                      ],
                                    ),
                                     const Divider(),
                                     const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Top Up", style: TextStyle(color: Colors.blue, fontSize: 20, ),),
                                      )) 
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                            Container(
                            child: Card(
                              shape: RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                color: Colors.grey, width: 0.7,),
                              ),
                              color: Colors.white,
                              child: SizedBox(
                                width: 300,
                                height: 100,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10), 
                                    
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Icon(Icons.share),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Share App"),
                                        ),
                                        Spacer(),                                        
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    const Divider(), 
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Icon(Icons.logout),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text("Logout"),
                                        ),
                                        Spacer(),                                        
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey,),
                                        )
                                      ],
                                    ),
                                    
                                  
                                  ],
                                ),
                              ),
                            ),
                          )
                        
                      ],
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: PositionedDirectional(
                          child: Container(
                          child: Card(
                            shape: RoundedRectangleBorder( 
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                              color: Colors.grey, width: 0.7,),
                            ),
                            color: Colors.white,
                            child: SizedBox(
                              width: 300,
                              height: 200,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),   
                                  Container(
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Theme.of(context).backgroundColor,
                                    child: const Icon(Icons.wallet, size: 30),),
                                  ), 
                                  const SizedBox(height: 20,),                               
                                  const Text("Account Balance"),
                                  const SizedBox(height: 10),  
                                  const Divider(thickness: 1.5,),
                                  TextButton.icon(onPressed: (){}, icon: const Icon(Icons.currency_exchange_outlined, color: Colors.black,), label: Text('Account Balance', style: TextStyle(color: Colors.black),))
                                ],
                              ),
                            ),
                          ),
                        )),
          ),
        ],
      ),
    );
  }
}