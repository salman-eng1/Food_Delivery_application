import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
PageController pageController =PageController(viewportFraction: 0.85);
var _currPageValue=0.0;
double _scaleFactor=0.8;
double _height=Dimensions.pageViewContainer;


@override
void initState(){
  super.initState();
  pageController.addListener(() {
    setState(() {
      _currPageValue = pageController.page!;
    });
  });
}

@override
void dispose(){
  pageController.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        //Slider Section
        Container(
        height: Dimensions.pageView,
        child: PageView.builder(
          //position and itemCount value is connected
          controller: pageController,
          itemCount: 5,
            itemBuilder: (context,position){
          return _buildPageItem(position);
        }),
      ),

        //dots

        DotsIndicator(
            dotsCount: 5,
          position: _currPageValue,
          decorator:  DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18.0,9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
          ),
        ),

        //Popular Text
        SizedBox(height: Dimensions.height15*2,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width15*2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing",),
              ),

            ],
          ),
        ),
        //list of food and images


        Container(
          height: Dimensions.height10*90,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
              itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width10*2,right: Dimensions.width10*2,bottom: Dimensions.height10),
              child: Row(
                children: [
                  //image section
                  Container(
                    height: Dimensions.height10*12,
                    width:Dimensions.height10*12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white30,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage('assets/image/food0.png',))
                    ),
                  ),
                  //text Container
                  Expanded(
                    child: Container(
                      height: Dimensions.height10*10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: 'Nutrious fruit meal in china',
                            ),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: 'with chinese characteristics'),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: 'Normal',
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: '1.7Km',
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '32min',
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        )
    ],
    );
  }
  //index is the position
  Widget _buildPageItem(int index ){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans =_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans =220*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans =_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      var currTrans =_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5fd):Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width10*3,right: Dimensions.width10*3,bottom: Dimensions.height10*3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5),
                    ) ,
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0),
                    ),
                  ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width15,right: Dimensions.width15),
                child: AppColumn(text: 'Chinese Side',)
              ),
            ),
          ),

        ],
      ),
    );
  }
}