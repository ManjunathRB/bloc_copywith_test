import 'package:bloc_copywith_test/bloc/copywith_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CopywithBloc copywithbloc = CopywithBloc();
  @override
  void initState() {
    copywithbloc.add(CopyWithIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Copy with method"),
        centerTitle: true,
      ),
      body: BlocBuilder<CopywithBloc, CopywithState>(
        bloc: copywithbloc,
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ));
            case Status.success:
              return ListView.builder(
                itemCount: state.names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor:
                        state.index == index ? Colors.green : Colors.white,
                    title: Text(state.names[index]),
                    onTap: () {
                      copywithbloc.add(SelectedIndexEvent(index));
                      debugPrint(state.index.toString());
                    },
                  );
                },
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
