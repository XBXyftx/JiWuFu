interface jiShuList {
  img: Resource
  text: string
  num: number
}

@Entry
@Component
struct Index {
  @State imgJi:Resource[]=[
    $rawfile('fu0.gif'),
    $rawfile('fu1.gif'),
    $rawfile('fu2.gif'),
    $rawfile('fu3.gif'),
    $rawfile('fu4.gif'),
    $rawfile('fu5.gif'),
  ]
  @State shengYuCiShu: number = 10
  @State zhongKaYeZ:number[] = [0,0]
  @State JiShu: jiShuList[] = [
    { img: $rawfile('fu0.png'), text: '万能福', num: 0 },
    { img: $rawfile('fu1.png'),text: '爱国福', num: 0 },
    { img: $rawfile('fu2.png'),text: '富强福', num: 0 },
    { img: $rawfile('fu3.png'),text: '和谐福', num: 0 },
    { img: $rawfile('fu4.png'), text: '敬业福', num: 0 },
    { img: $rawfile('fu5.png'), text: '友善福', num: 0 },
  ]
  @State randomNum:number=0
  @State scaleX:number=0.7
  @State scaleY:number=0.7
  @State zhongjiang:boolean=false
  @State duiHuanYe:number[]=[0,0]


  build() {
    //根组件
    Stack() {

      //基础页最外层组件
      Column() {

        //上半区抽卡最外层
        Stack() {

          //金色圈
          Row() {
            if (this.zhongjiang){
              Text('立即合成')
                .fontSize(20)
                .width(60)
                .padding(5)
                .fontWeight(700)
                .textAlign(TextAlign.Center)
                .height(60)
                .borderRadius(60)
                .backgroundColor('#fffcc02d')
            }else {
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


          }
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width(300)
          .borderRadius(150)
          .height(300)
          .border({ width: 1, color: '#fffff08f' })
          .zIndex(1)

          if (this.JiShu[1].num===0){
            //上1
            Image($rawfile('fu1.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 140, y: -30 })
              .zIndex(0)
              .opacity(0.5)
          }else {
            Image($rawfile('fu1.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 140, y: -30 })
              .zIndex(2)
              .opacity(1)
          }
          if (this.JiShu[2].num===0){
            //右2
            Image($rawfile('fu2.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 280, y: 100 })
              .zIndex(0)
              .opacity(0.5)
          }else {
            Image($rawfile('fu2.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 280, y: 100 })
              .zIndex(2)
              .opacity(1)
          }

          if (this.JiShu[3].num===0){
            //右下3
            Image($rawfile('fu3.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 220, y: 240 })
              .zIndex(0)
              .opacity(0.5)
          }else {
            Image($rawfile('fu3.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 220, y: 240 })
              .zIndex(2)
              .opacity(1)
          }
          if (this.JiShu[4].num===0){
            //左下4
            Image($rawfile('fu4.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 60, y: 240 })
              .zIndex(0)
              .opacity(0.5)
          }else {
            Image($rawfile('fu4.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 60, y: 240 })
              .zIndex(2)
              .opacity(1)
          }

          if (this.JiShu[5].num===0){
            //左5
            Image($rawfile('fu5.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 0, y: 100 })
              .zIndex(0)
              .opacity(0.5)
          }else {
            Image($rawfile('fu5.gif'))
              .width(60)
              .borderRadius(2)
              .position({ x: 0, y: 100 })
              .zIndex(2)
              .opacity(1)
          }



        }
        .width('100%')
        .margin({ top: 50, bottom: 100 })

        //下半区计数列表
        List({ space: 20 }) {

          ForEach(this.JiShu, (item: jiShuList, i) => {
            ListItem() {
              Badge({
                value: item.num.toString(),
                style: { badgeSize: 16, badgeColor: Color.Red }
              }) {
                Column({ space: 5 }) {
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
        .margin({ bottom: 50 })
        .scrollBar(BarState.Off)


        //最下方抽卡按钮
        Button(`抽福卡 (剩余次数：${this.shengYuCiShu})`)
          .padding(20)
          .backgroundColor('#fff4c168')
          .fontColor(Color.Red)
          .onClick(()=>{
            if (this.shengYuCiShu>0) {
              this.randomNum=Math.floor(Math.random()*6)
              this.zhongKaYeZ=[2,1]
              this.shengYuCiShu--
              this.scaleX=1.1
              this.scaleY=1.1
            }

          })

      }
      .width('100%')
      .height('100%')
      .zIndex(1)
      .padding(10)

      //中卡页面
      Column({ space: 40 }) {
        Image($rawfile('CloseChaZi.svg'))
          .width(20)
          .translate({ x: 130 })
          .onClick(()=>{
            this.zhongKaYeZ=[0,0]
            this.scaleX=0.9
            this.scaleY=0.9
          })
        if (this.randomNum>0){
          Image(this.imgJi[this.randomNum])
            .width(300)
            .borderRadius(14)
            .scale({x:this.scaleX,y:this.scaleY})
            .animation({
              duration:500
            })
        }else if(this.randomNum===0){
          Column({space:20}){
            Image($rawfile('fu0.gif'))
              .width(300)
            Text('万能富祝您万事胜意')
              .fontSize(20)
              .fontColor(Color.Yellow)
              .fontWeight(600)
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .scale({x:this.scaleX,y:this.scaleY})
          .animation({
            duration:500
          })
        }

        Button('收下福卡')
          .width(200)
          .backgroundColor('#fff4c168')
          .fontColor(Color.Red)
          .onClick(()=>{
            this.JiShu[this.randomNum]={
              img:$rawfile(`fu${this.randomNum}.png`),
              text:this.JiShu[this.randomNum].text,
              num:++this.JiShu[this.randomNum].num,
            }
            this.zhongKaYeZ=[0,0]
            this.scaleX=0.7
            this.scaleY=0.7

            let count:number=0
            for (let i=1 ;i<this.JiShu.length;i++){
              if (this.JiShu[i].num>0) {
                ++count
              }else {
                break
              }
            }
            if (count===5) {
              this.zhongjiang=true
            }


          })
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .zIndex(this.zhongKaYeZ[0])
      .opacity(this.zhongKaYeZ[1])

      //兑换万能卡页面
      Column(){
        Flex({wrap:FlexWrap.Wrap}){
          ForEach(this.imgJi,(item:Resource,i)=>{
            if (i===0) {

            }else {
              Image(item)
                .width(100)
                .borderRadius(10)
                .margin(40)
                .onClick(()=>{
                  this.duiHuanYe=[0,0]
                  this.JiShu[i].num++
                  this.JiShu[0].num--
                })
            }
          })
        }
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.8)')
      .zIndex(this.duiHuanYe[0])
      .opacity(this.duiHuanYe[1])

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ff020e34')
  }
}