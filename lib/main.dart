import 'package:bloc_01/bloc/count_bloc/count_bloc.dart';
import 'package:bloc_01/bloc/count_bloc/count_state.dart';
import 'package:bloc_01/common/routes/routes.dart';
import 'package:bloc_01/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/count_bloc/count_event.dart';


void main() async{
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [...AppPages.allBlocProviders(context)],//BlocProviderPage.blocProviders,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                color: Colors.white
              ),
              primarySwatch: Colors.blue,
            ),
            // home: const ApplicationPage(),//const OnBoardingScreen(),
            onGenerateRoute: AppPages.generatePageRoute,
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<CountBloc,CountState>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${BlocProvider.of<CountBloc>(context).state.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },)
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "DecrementTag",
            onPressed: () => BlocProvider.of<CountBloc>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "InecrementTag",
            onPressed: () => BlocProvider.of<CountBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
