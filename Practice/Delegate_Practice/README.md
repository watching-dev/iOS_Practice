# Delegate_Practice

***

#### 매번 햇갈리는 딜리게이트 패턴 사용법

이제 드디어 알게 되었다.

> Protocol은 class처럼 아무 파일 상관없이 정의 가능

#### 시작

> 1번파일, 2번파일 이렇게 있다고 했을때,

> 1번파일에 protocol 정의

```
protocol exampleDelegate: AnyObject {

# AnyObject는 (구 class) class에서만 사용 가능

 func changeData(data: String)

}
```

#### 사용 방법

> 1번 뷰컨트롤러 -> 2번 뷰컨트롤러 이동 -> 다시 1번 뷰컨트롤러 이동하면서 데이터 전달

> 1번 파일 시점

```
class 1번 뷰컨트롤러: UIViewController, ...(상속 받을것들 다 하고), (맨 마지막에) exampleDelegate {

# 위에 정의한 프로토콜 함수 구현해 주면 됨(안하면 에러 나옴)

 var data: String?

 func changeData(data: String) {

   self.data = data
	
}

# 화면 이동할때

 func 화면이동함수() {

  let storyboard = UIStoryboard.init(name: "Main", bundle: nil)

# as? 2번 뷰컨트롤러 안해주면 popUp.delegate 자동완성 안됨
  guard let popUp = storyboard.instantiateViewController(withIdentifier: "2번 뷰컨트롤러") as? 2번 뷰컨트롤러 else { return }

  popUp.modalPresentationStyle = .overFullScreen

# 여기서 self 안해주면 동작 안함
  popUp.delegate = self

  present(popUp, animated: true)
}

```

***

> 2번 파일 시점

> 프로토콜 만든 함수 사용하는거라 생각보다 쉬움

> 만들때 순서를 어떻게 할건지만 고민하면 됨

```
class 2번 뷰컨트롤러: UIViewController {

# 아래처럼 delegate 변수 만들어주고
 weak var delegate: exampleDelegate?

# 필요한 곳에 가서
 self.delegate.changeData(data: "전달할 데이터")

# 이렇게 사용하면 끝!
}
```

***

#### 정리

> 프로토콜을 만든다(파일로 나눠서 만들어도 되고 뷰컨트롤러에 만들어도 되고)

> 구현 / 사용 어떻게 할지만 고민 하면 된다

> 구현의 경우는

> class 에서 프로토콜 사용 선언 /  함수 구현 /  사용하는 객체.delegate = self 

> -

> 사용의 경우는

> weak var delegate: 프로토콜? 만들고 /  self.delegate.함수() 로 사용

> 