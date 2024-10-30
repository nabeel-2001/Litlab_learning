import 'package:flutter/material.dart';
import 'package:litlab_learning/feature/save_notes/screen/save_note_web.dart';


String favouritePageView = '/';
Map favouritePageViewRoute ={
  '/':FavoritesPageState(),
  '/module':Text("test")

};

class FavouritePageWebMainScreen extends StatefulWidget {
  const FavouritePageWebMainScreen({super.key});

  @override
  State<FavouritePageWebMainScreen> createState() => _FavouritePageWebMainScreenState();
}

class _FavouritePageWebMainScreenState extends State<FavouritePageWebMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:favouritePageViewRoute[favouritePageView] ,
    );
  }
}
