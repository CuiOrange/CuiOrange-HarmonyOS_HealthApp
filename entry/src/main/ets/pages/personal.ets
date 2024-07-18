import router from '@ohos.router';
@Entry
@Component

struct MyPage {
  selectedDate: Date = new Date("2010-1-1")

  @Builder
  build() {
Column(){
  Row(){
    Button({type: ButtonType.Circle}){
    Image($r('app.media.ic_tabs_home_normal'))
      .width(30)}
    .backgroundColor(Color.White)
    .onClick(() => {
      router.back(); // 返回上一页，当前页面会销毁
    })
    Text('个人资料')
    Image($r('app.media.ic_right_grey'))
      .width(24)
  }
  .justifyContent(FlexAlign.SpaceBetween)
  .width('100%')
  .height(40)
  .backgroundColor(Color.White)
      Flex({ direction: FlexDirection.Column }) {
        Flex({ direction: FlexDirection.Column }) {
          Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
            Column({ space: 10 }) {
              Image($r('app.media.ic_user'))
                .width(64)
                .height(64)
              Text('昵称')
            }.onClick(() => {

            })
          }
          .width('100%')
          .height(150)
          .backgroundColor(0x70DBDB)

          Row() {
            Text('性别：')
              .fontSize(16)

            TextInput({ placeholder: ""})
              .layoutWeight(1)
              .height(45)
              .type(InputType.Normal)
              .fontColor(Color.Brown)
              .enterKeyType(EnterKeyType.Next)
              .caretColor(Color.Red)
              .placeholderColor(Color.Green)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .width('100%')
          .height(60)
          Row() {
            Text('出生日期：')
              .fontSize(16)
                 .onClick(() => {
          DatePickerDialog.show({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            lunar: true,
            disappearTextStyle: {color: Color.Pink, font: {size: '22fp', weight: FontWeight.Bold}},
            textStyle: {color: '#ff00ff00', font: {size: '18fp', weight: FontWeight.Normal}},
            selectedTextStyle: {color: '#ff182431', font: {size: '14fp', weight: FontWeight.Regular}},
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info("DatePickerDialog:onDateAccept()" + value.toString())
            },
            onCancel: () => {
              console.info("DatePickerDialog:onCancel()")
            },
            onDateChange: (value: Date) => {
              console.info("DatePickerDialog:onDateChange()" + value.toString())
            },
            onDidAppear: () => {
              console.info("DatePickerDialog:onDidAppear()")
            },
            onDidDisappear: () => {
              console.info("DatePickerDialog:onDidDisappear()")
            },
            onWillAppear: () => {
              console.info("DatePickerDialog:onWillAppear()")
            },
            onWillDisappear: () => {
              console.info("DatePickerDialog:onWillDisappear()")
            }
          })
        })
            TextInput({ placeholder: ""})
              .layoutWeight(1)
              .height(45)
              .type(InputType.Normal)
              .fontColor(Color.Brown)
              .enterKeyType(EnterKeyType.Next)
              .caretColor(Color.Red)
              .placeholderColor(Color.Green)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .width('100%')
          .height(60)
          Row() {
            Text('身高：')
              .fontSize(16)
            TextInput({ placeholder: ""})
              .layoutWeight(1)
              .height(45)
              .type(InputType.Normal)
              .fontColor(Color.Brown)
              .enterKeyType(EnterKeyType.Next)
              .caretColor(Color.Red)
              .placeholderColor(Color.Green)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .width('100%')
          .height(60)
          Row() {
            Text('体重：')
              .fontSize(16)

            TextInput()
              .layoutWeight(1)
              .height(45)
              .type(InputType.Normal)
              .fontColor(Color.Brown)
              .enterKeyType(EnterKeyType.Next)
              .caretColor(Color.Red)
              .placeholderColor(Color.Green)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .width('100%')
          .height(60)
          Row() {
            Text('年龄：')
              .fontSize(16)

            TextInput({ placeholder: ""})
              .layoutWeight(1)
              .height(45)
              .type(InputType.Normal)
              .fontColor(Color.Brown)
              .enterKeyType(EnterKeyType.Next)
              .caretColor(Color.Red)
              .placeholderColor(Color.Green)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .width('100%')
          .height(60)
          }
          .width('100%')
          .flexGrow(1)
        }
        .width('100%')
      }
    }
  }