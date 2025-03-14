import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/development/cubit/development_cubit.dart';
import 'package:myth/features/development/data/model/development.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/error_and_loading.dart';

class DevelopmentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: S.of(context).development,
          context: context,
          showBackButton: false),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<DevelopmentCubit, DevelopmentState>(
          builder: (context, state) {
            return state.when(
              initial: ()=> Loading(), loading: ()=> Loading(), success: (data){
              return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final month = index + 1;
                final isPresent = data.any((dev) =>
                    dev.startDate != null && dev.startDate!.month == month);
                if(isPresent){
                  final development = data.firstWhere((dev)=>dev.startDate != null && dev.startDate!.month == month);
                  return monthCard(index + 1, context , isPresent:isPresent , development: development);
                }else{
                  return monthCard(index + 1, context , isPresent:isPresent);
                }
              },
            );
              }, failure: (failure)=>ErrorWidget(failure));
          },
        ),
      ),
    );
  }

  Widget monthCard(int month, BuildContext context, {required bool isPresent ,Development? development}) {
    return Container(
      decoration: BoxDecoration(
        color: isPresent?Colors.green[200]:Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${S.of(context).month} $month',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if(!isPresent)return;
              Navigator.of(context).pushNamed(Routes.development_details);
            },
            child: Text(S.of(context).details),
          ),
        ],
      ),
    );
  }
}
