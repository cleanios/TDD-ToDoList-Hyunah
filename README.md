# TDD-ToDoList
Test-Driven-Develop with swift 를 읽고 튜토리얼을 진행합니다.

## Use Case

### Task list view
- 유저는 앱을 실행하면 to-do 아이템 리스트를 볼 수 있다.
- to-do 아이템을 추가할 수 있다.

### Task detail view
- 유저는 리스트에서 아이템을 탭하면 상세를 볼 수 있다.
- 유저는 상세 화면에서 아이템을  `check` 할 수 있다.

### Task input view
유저가 `+` 버튼을 리스트 화면에서 누르면 task input view가 나타난다. 
- 유저는 아이템 리스트에서  `+` 버튼을 눌러서 정보를 입력할 수 있는 form 을 볼 수 있다. ( 단, title만 필수, date, location name, address, description은 optional)
- 유저는 `save` 버튼을 눌러서 리스트에 아이템을 추가할 수 있다.


### Development strategy
- 내부에서 -> 외부로 
- 따라서 model서 부터 작성하고 -> 컨트롤러 -> 네트워킹 순으로 개발한다. 
- UI Test는 하지 않는다.
