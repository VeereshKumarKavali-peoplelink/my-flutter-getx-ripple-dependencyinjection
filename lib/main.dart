import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_ripple_dependencyinjection/my_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /*
    Here by default isSingleton is true, it means only instance is created 
    My controller instance will be created even if it is not used
    tag will be used to find the instance with tag name 
    controller disposed when it is not used but if permanent is true, the instance will be alive through out the app 

    MyController myController = Get.put(MyController(), permanent: true);   

                     (or)

    MyController myController = Get.put(MyController(), tag: 'instance1', permanent: true);

    */

  



    /* 
     Here by default isSingleton is true, it means only instance is created 
    Instance will be created when it is used

    Get.lazyPut(()=> MyController());

              (or)

    fenix is similar to 'permanent" , the difference is that the instance is discarded when is not being used 
    but when its use is needed again, Get will recreate the instance

    Get.lazyPut(()=> MyController, tag: 'instance2', fenix: true);
    */

    


    Get.putAsync<MyController>(()async => await MyController());



    //Here permanent will be true by default and isSingleton is false (Mutiple instance will be created)
    //Get.create<MyController>(()=> MyController());




    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green,),
      home: Scaffold(
        appBar: AppBar(title: const Text("Getx Dependency Injection")),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              //Instance will be created with tag 
              //Get.find<MyController>(tag: 'instance1');

              //Find instance 
              //Get.find<MyController>();

              Get.find<MyController>().incrementCounter();

            }, child: const Text("Click Me"))
          ],

        ))

      ),
    );
  }
}
