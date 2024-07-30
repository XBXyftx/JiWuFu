

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

          }
          .width(300)
          .borderRadius(150)
          .height(300)
          .border({width:1,color:'#fffff08f'})
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