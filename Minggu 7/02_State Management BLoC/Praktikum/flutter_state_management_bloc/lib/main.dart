import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_state_management_bloc/routes/routes_navigation.dart';
import 'package:flutter_state_management_bloc/screen/contact_screen.dart';
import 'package:flutter_state_management_bloc/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advance Flutter Form',
        initialRoute: RoutesNavigation.splashScreen,
        routes: {
          RoutesNavigation.splashScreen: (_) => const SplashScreen(),
          RoutesNavigation.contactScreen: (_) => const ContactScreen(),
        },
      ),
    );
  }
}
