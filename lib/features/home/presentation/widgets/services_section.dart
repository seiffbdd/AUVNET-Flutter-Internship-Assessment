import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/presentation/view_models/home_cubit/home_cubit.dart';

import 'package:nawel/features/home/presentation/widgets/service_column.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.services.length,
            itemBuilder: (context, index) {
              return ServiceColumn(
                image: state.services[index].image,
                title: state.services[index].title,
                time: state.services[index].time,
              );
            },
          );
        } else if (state.errMessage != null) {
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
