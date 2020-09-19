import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductImage extends StatelessWidget{
  final List<String> images;
  final SizingInformation sizingInformation;
  ProductImage({Key key,@required this.images,@required this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 250,
        height: 300,
        child: Image.network(
            images[0],
            fit:BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null)
                return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        )
    );
  }

}
/*

class _ProductImageState extends State<ProductImage> {
  var index = 0;
  Widget previous = Container();
  Widget current = Container();
  Timer timer;
  final List<Widget> slides;

  _ProductImageState({@required this.slides});

  @override
  void initState() {
    print(widget.images);
    current = slides[0];
    previous = slides[slides.length-1];
    super.initState();
    _setUp();
  }

  _setUp(){
    timer = Timer.periodic(widget.delay, (timer) {
      setState(() {
        index++;
        if(index >= slides.length) index = 0;
        current = slides[index];
        final previousIndex = index == 0 ? slides.length-1 : index-1;
        previous = slides[previousIndex];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 172),
      child: Container(
        width: 924,
        height: 1022,
        child: CustomAnimation<double>(
          control: CustomAnimationControl.PLAY_FROM_START,
          tween: 0.0.tweenTo(1.0),
          builder: (context, child, value) => Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: value,
                child: current,
              ),
              Opacity(
                opacity: (value-1).abs(),
                child: previous,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(slides.length, (index) => Padding(
                    padding: EdgeInsets.all(4),
                    child: Stack(
                      children: [
                        Icon(CustomIcons.emptycircle_,size: 14,),
                        this.index == index ?
                        Opacity(
                          opacity: value,
                          child: Icon(CustomIcons.circle,size: 14,),
                        ):
                        Opacity(
                          opacity: (value-1).abs(),
                          child: Icon(CustomIcons.circle,size: 14,),
                        ),
                      ],
                    ),
                  ),
                  ),
                )
              )
            ],
          ),
          duration: widget.duration,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}*/
