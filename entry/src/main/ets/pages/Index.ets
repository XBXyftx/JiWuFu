interface jiShuList{
  img:Resource
  text:string
  num:number
}

@Entry
@Component
struct Index {
  @State shengYuCiShu:number=10
  @State  Opacity:number[]=[0.5,0.5,0.5,0.5,0.5]

  @State JiShu:jiShuList[]=[
    {img:$rawfile('wanneng.png'),text:'万能福',num:0},
    {img:$rawfile('aiguo.png'),text:'爱国福',num:0},
    {img:$rawfile('fuqiang.png'),text:'富强福',num:0},
    {img:$rawfile('hexie.png'),text:'和谐福',num:0},
    {img:$rawfile('youshan.png'),text:'友善福',num:0},
  ]

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

          //上1
          Image($rawfile('aiguo.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:140,y:-30})
            .zIndex(0)
            .opacity(this.Opacity[0])
          //右2
          Image($rawfile('hexie.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:280,y:100})
            .zIndex(0)
            .opacity(this.Opacity[1])
          //右下3
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:220,y:240})
            .zIndex(0)
            .opacity(this.Opacity[2])
          //左下4
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:60,y:240})
            .zIndex(0)
            .opacity(this.Opacity[3])
          //左5
          Image($rawfile('jingye.gif'))
            .width(60)
            .borderRadius(2)
            .position({x:0,y:100})
            .zIndex(0)
            .opacity(this.Opacity[4])



        }
        .width('100%')
        .margin({top:50,bottom:100})

        //下半区计数列表
        List({space:20}){

          ForEach(this.JiShu,(item:jiShuList,i)=>{
            ListItem(){
              Badge({
                value:`${item.num}`,
                style:{badgeSize:16,badgeColor:Color.Red}
              }){
                Column({space:5}){
                  Image(item.img)
                    .width(60)
                  Text(item.text)
                    .fontColor(Color.White)
                }
              }
            }
            .padding(5)
          })

        }
        .width('100%')
        .listDirection(Axis.Horizontal)
        .height(120)
        .margin({bottom:50})
        .scrollBar(BarState.Off)


        //最下方抽卡按钮
        Button(`抽福卡 (剩余次数：${this.shengYuCiShu})`)
          .padding(20)
          .backgroundColor('#fff4c168')
          .fontColor(Color.Red)

      }
      .width('100%')
      .height('100%')
      .zIndex(1)
      .padding(10)

      //中卡页面
      Column({space:20}){
        Image($rawfile('CloseChaZi.svg'))
          .width(20)
          .translate({x:130})
        Image($rawfile('fuqiang.gif'))
          .width(300)
          .borderRadius(14)
        Button('收下福卡')
          .width(200)
          .backgroundColor('#fff4c168')
          .fontColor(Color.Red)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .zIndex(2)


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ff020e34')
  }
}