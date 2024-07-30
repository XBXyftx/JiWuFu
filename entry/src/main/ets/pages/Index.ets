interface stuInfoType {
  id: number
  name: string
  score: string
}

@Entry
@Component
struct Index {
  @State studentList: stuInfoType[] = [
    { id: 1, name: '张三', score: (Math.random() * 100).toFixed() },
    { id: 2, name: '李四', score: (Math.random() * 100).toFixed() },
    { id: 3, name: '王五', score: (Math.random() * 100).toFixed() },
  ]

  build() {
    Button('计算分数和').onClick(() => {
      let sum: number = 0
      for (let i = 0; i < this.studentList.length; i++) {
        sum += parseFloat(this.studentList[i].score)
      }
      console.log('分数和为：', sum)
    })
  }
}