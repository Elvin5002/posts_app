import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/cubits/detail/detail_cubit.dart';

class DetailsPage extends StatelessWidget {
const DetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final cubit = context.read<DetailCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          child: StreamBuilder(
            stream: cubit.postDetailStream,
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final post = snapshot.data!;
              return Column(
                  children: [
                    Text(post.id.toString()),
                    const SizedBox(height: 5,),
                    Text(post.title!),
                    const SizedBox(height: 5,),
                    Text(post.body!),
                  ],
              );
            }
          ),
        ),
      )
    );
  }
}