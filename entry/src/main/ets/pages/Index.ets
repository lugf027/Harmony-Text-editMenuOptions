@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      TextExample12();
    }
    .height('100%')
    .width('100%');
  }
}

const RETURN_TRUE = '返回true';
const RETURN_FALSE = '返回false';

// https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#%E7%A4%BA%E4%BE%8B12%E6%96%87%E6%9C%AC%E6%89%A9%E5%B1%95%E8%87%AA%E5%AE%9A%E4%B9%89%E8%8F%9C%E5%8D%95
@Component
struct TextExample12 {
  @State text: string =
    '天之道，损有余而奉不足。天之道，损有余而奉不足。天之道，损有余而奉不足。天之道，损有余而奉不足。天之道，损有余而奉不足。';
  onCreateMenu = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: RETURN_TRUE,
      id: TextMenuItemId.of(RETURN_TRUE),
    };
    let item2: TextMenuItem = {
      content: RETURN_TRUE,
      id: TextMenuItemId.of(RETURN_TRUE),
    };
    menuItems.length = 0;
    menuItems.push(item1);
    menuItems.push(item2);
    return menuItems;
  };
  onMenuItemClick = (menuItem: TextMenuItem, textRange: TextRange) => {
    if (menuItem.id.equals(TextMenuItemId.of(RETURN_TRUE))) {
      console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.of(RETURN_FALSE))) {
      console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end);
      return false;
    }
    return false;
  };
  @State
  editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu, onMenuItemClick: this.onMenuItemClick
  };

  build() {
    Column() {
      Text(this.text)
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions(this.editMenuOptions)
        .margin({ top: 100 });
    }
    .width('90%')
    .margin('5%');
  }
}