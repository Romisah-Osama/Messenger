import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/messenger/products_cubit.dart';
import 'package:my_app/messenger/story_screen.dart';
import 'chats_screen.dart'; // Fixed file name capitalization

class MessengerScreen extends StatefulWidget {
  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  late ProductsCubit productsCubit;

  @override
  void initState() {
    super.initState();

    productsCubit = ProductsCubit();
    productsCubit.getProductsFromCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                "https://thumbs.dreamstime.com/b/inverted-autumn-view-crystal-ball-fallen-birch-tree-lies-reflection-forest-close-up-side-233379775.jpg?w=768",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => productsCubit,
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is ProductsError) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ProductsSuccess) {
              print("-------> success");

            }
          },
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 10),
                            Text("Search"),
                          ],

                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = state.productsModel.products![index];
                            return Story(
                              name: product.title!,
                              image: product.thumbnail!,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemCount: state.productsModel.products!.length,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final product = state.productsModel.products![index];
                            return Chats(
                              name: product.title!,
                              messege: product.category!,
                              time: product.price!.toString(),
                              image: product.thumbnail!,
                              message: '',
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15),
                          itemCount: state.productsModel.products!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}