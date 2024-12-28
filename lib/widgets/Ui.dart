import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final/blocs/ui_bloc.dart';
import 'package:flutter_final/data/data_layer.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 155, 177),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Map<String, dynamic>?>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('No data available'));
              }

              final data = snapshot.data!;
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(70.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios_new,
                              size: 24, color: Colors.grey[600]),
                          Text(
                            'Details',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20),
                          ),
                          Icon(Icons.share_outlined, color: Colors.grey[600]),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Image.network(
                          data['image'] ??
                              'https://upload.wikimedia.org/wikipedia/commons/1/14/Milkshake_beverage_strawberry_drink-1021027.jpg',
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            data['item'] ?? 'Item Name',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 85,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 235, 132, 166)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<CounterCubit>().decrement();
                                  },
                                  icon: const Icon(Icons.remove_circle_outline,
                                      size: 20),
                                  color: Colors.grey[600],
                                ),
                                BlocBuilder<CounterCubit, int>(
                                  builder: (context, count) {
                                    return Text(
                                      count.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<CounterCubit>().increment();
                                  },
                                  icon: const Icon(Icons.add_circle_outline,
                                      size: 20),
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data['portion'] ?? 'Portion info not available',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              data['RatingStarCount'] ?? 0,
                              (index) => Icon(Icons.star,
                                  color: Colors.yellow[700], size: 15),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(30)',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['message'] ??
                            'Description not available for this item.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
