import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          bottom: const TabBar(tabs: [
            Tab(
              child: Icon(Icons.camera_alt,size: 20,),
            ),
            Tab(
              child: Text('Chats'),
            ),
            Tab(child: Text('Status')),
            Tab(child: Text('Calls')),
          ]),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon:const Icon(Icons.more_vert_outlined),
                itemBuilder: (
                  context,
                ) =>
                   const [
                      PopupMenuItem(
                        value: 1,
                        child: Text('New Group'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Logout'),
                      ),
                    ]),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(children: [
          Text('Camera'),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ),
                title: Text('John Wick'),
                subtitle: Text('Where is my dog?'),
                trailing: Text('6:39PM'),
              );
          }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                if(index == 0){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Updates'),
                      ],
                    ),
                  );
                }
               else{
                  return  ListTile(
                    leading: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color:Colors.teal,

                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      ),
                    ),
                    title: Text('John Wick'),
                    subtitle: Text('35 min ago'),
                  );
                }
              }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                return  ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=600'),
                  ),
                  title: Text('John Wick'),
                  subtitle: Text('Yesterday, 10:29PM'),
                  trailing: Icon(index %2 == 0?Icons.phone:Icons.videocam,color: Colors.teal,),
                );
              }),
        ]),
      ),
    );
  }
}
