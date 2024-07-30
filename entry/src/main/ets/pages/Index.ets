

@Entry
@Component
struct Index {

  build() {
    //根组件
    Stack(){

      //基础页最外层组件
      Column(){

        //上半区抽卡最外层
        Stack(){

          //金色圈
          Row(){
            Text('立即合成')
              .fontSize(20)
              .width(60)
              .padding(5)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .height(60)
              .borderRadius(60)
              .backgroundColor(Color.Gray)

          }
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width(300)
          .borderRadius(150)
          .height(300)
          .border({width:1,color:'#fffff08f'})
          .zIndex(1)

          //上
          Image($rawfile('aiguo.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:140,y:-30})
            .zIndex(0)
            .opacity(0.5)
          //右
          Image($rawfile('hexie.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:280,y:100})
            .zIndex(0)
            .opacity(0.5)
          //右下
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:220,y:240})
            .zIndex(0)
            .opacity(0.5)
          //左下
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:60,y:240})
            .zIndex(0)
            .opacity(0.5)
          //左
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:0,y:100})
            .zIndex(0)
            .opacity(0.5)



        }
        .width('100%')

        .margin({top:50,bottom:50})
      }
      .width('100%')
      .height('100%')
      .zIndex(1)
      .padding(10)


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ff020e34')
  }
}