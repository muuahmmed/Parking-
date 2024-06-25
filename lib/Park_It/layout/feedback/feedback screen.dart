import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f/Park_It/components/components.dart';
import 'package:f/Park_It/layout/home/cubit/cubit.dart';
import 'package:f/Park_It/layout/home/cubit/states.dart';
import 'package:f/Park_It/layout/home/home_screen.dart';


class FeedbackScreen extends StatefulWidget{
  const FeedbackScreen({super.key});
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}
class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
  listener: (context, state) {
    // TODO: implement listener
    if( state is MakeUserFeedbackSuccessState)
      {
        ParkingCubit.get(context).feedBackController.clear();
        showToast(text: "Send Successfully", state: ToastStates.SUCCESS);

      }
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { navigateTo(context,const Home()); }, icon:const Icon(Icons.arrow_back_sharp,color: Colors.white,) ,
        ),
        title:const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.feed_outlined,color: Colors.white,size: 150,),
              const SizedBox(height: 30,),
              const Text('MAKE YOUR FEEDBACK TO IMPROVE THE SERVICES OF US',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 18),),
        
        
              const SizedBox(height: 30,),
              TextFormField(
                controller:ParkingCubit.get(context).feedBackController ,
                maxLines: 6,
                validator: (String? value)
                {
                  if(value!.isEmpty){
                    return('');
                  }
                  return null;
                },
                onChanged: (String value){
                },
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Message:',
                  ),
        
                keyboardType: TextInputType.visiblePassword,
        
              ),
              const SizedBox(height: 30,),
        
              state is MakeUserFeedbackLoadingState ?const Center(child: CircularProgressIndicator()): Container(
              width: 200,
              height: 45,
              color: Colors.red,
              child:
              MaterialButton(onPressed: (){
        
              ParkingCubit.get(context).makeFeedback();
              },
                child: const Text('Send',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),))
            ],
          ),
        ),
      ),
    );
  },
);
  }
}