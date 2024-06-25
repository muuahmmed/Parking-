import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../network/local/cache_helper.dart';
import '../../shared/components.dart';
import '../log or reg/second_screen.dart';


class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  }) ;
}
class OnBoardingScreen extends StatefulWidget
{

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  void submit()
  {
    CacheHelper.saveData(
        key:'onBoarding',
        value:true)
        .then((value)
    {
      if (value)
      {
        {
          navigateAndFinish(context,const Second_Screen() );
        }
      }
    }
    );
  }
  List<BoardingModel> boarding =[
    BoardingModel(
      title: 'We make parking effortless',
      body: 'Real-time availability of parking spots to quickly find a spot to park your vehicle',
      image:'assets/images/11.png',

    ),
    BoardingModel(
      title: 'Receive timely notifications',
      body: 'Real-time availability of parking spots to quickly find a spot to park your vehicle',
      image:'assets/images/33.png',


    ),
    BoardingModel(
      title: 'Enable location services',
      body: 'Real-time availability of parking spots to quickly find a spot to park your vehicle',
      image:'assets/images/44.png',


    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(onPressed: ()
          {
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) => const Second_Screen(),));
          },child: const Text(
            'Skip',style: TextStyle(
            color: Colors.white,
              fontSize: 13.5,
              fontWeight: FontWeight.bold),
          ),),
        ],),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index == boarding.length-1)
                  {
                    setState(()
                    {
                      isLast =true;
                    });
                  }else
                  {
                    setState(()
                    {
                      isLast =false;
                    });
                  }
                },
                itemBuilder: (context,index)=> buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController, count: boarding.length,effect:  const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight:10 ,
                  dotWidth:10,
                  expansionFactor: 4,
                  spacing: 5,
                  activeDotColor: Colors.red,
                ),),
                const Spacer(),
                FloatingActionButton(
                  onPressed: ()
                {
                  if(isLast)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => const Second_Screen(),));
                  }else
                  {
                    boardController.nextPage(duration:
                    const Duration(
                        microseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                  child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Expanded(
          child: Image(image:
          AssetImage(
            model.image,
          ),width: double.infinity,height: 200
          ),
        ),
        const SizedBox(height: 20,),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
  );
}


