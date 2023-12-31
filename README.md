# iOS_Practice
iOS Practice History

***

#### git 명령어 정리(습관적으로 config -l 과 branch 확인 / 계정정보와 브랜치는 수시로 확인)

```
브랜치 관련
- git branch: 브랜치 확인
- git branch -a: 원격 포함해서 전체 브랜치 확인
- git branch -r: 원격 브랜치 확인
- ~~git switch 브랜치_이름: 브랜치_이름으로 브랜치 변경(이동) -- 차이가 뭐지..~~
- git checkout 브랜치_이름: 브랜치_이름으로 브랜치 변경(이동) -- 차이가 뭐지.._그냥 이걸로 사용, 원격까지 같이 설정
- git checkout -b 브랜치_이름: 브랜치_이름 으로 브랜치 만들고 브랜치 변경(이동)
- ~~git branch 브랜치_이름: 브랜치_이름 으로 새로운 브랜치 생성(이동은 안함)~~
- git branch -d 브랜치_이름: 브랜치_이름 브랜치 삭제 / 안되면 D 로
- git merge 브랜치이름: 현재 브랜치에 브랜치이름 병합(현재 브랜치 <- 브랜치이름) / 기준이 현재 브랜치(에 추가하는것)
- merge 할때는 꼭 새로운 브랜치 만들어서 그걸 병합하고 삭제하도록! 기존꺼를 계속 사용하려면 이렇게 해야함, 안하면 꼬인다
- merge 에서 conflict 나오면 -> 수정하고 -> git add . -> git merge --continue -> 이렇게 해야 merge 메시지가 남음
- git push -u origin --delete 브랜치이름: 원격 브랜치이름 브랜치 삭제 / git push -u origin :브랜치이름

설정 관련
- git config -l: 깃 설정 확인
- git config --local user.email 이메일: 이메일 등록(안하면 컴퓨터 이름으로 등록됨 / --local 추천)
- git config --local user.name 이름: 이름 등록(안하면 컴퓨터 이름으로 등록됨 / --local 추천)
- git remote -v: 깃 원격 주소 확인

커밋 관련
- git add .: 전체 스테이지에 올림
- git commit -m "커밋 메시지": 커밋 메시지로 커밋
- git push -u origin main: origin 이름의 main 브랜치로 푸시(-u 로 하면 다음부터는 git push 만 해도 자동으로 됨, 근데 그냥 매번 다 입력하는거 추천)
- git status: 변경사항 확인
- git log: 커밋 로그 확인
- git fetch: 데이터 가져옴 - 아직 잘 모르겠다 - 다른 브랜치 가져올때 - git fetch 한다음 - git checkout 다른_브랜치_이름 - 하면 자동으로 브랜치 변경되면서 가져옴
- git pull: 데이터 가져와서 기존 브랜치랑 병합
- git reset: add 해서 스테이징 한것들 전체 다 취소
- git reset 파일명: 파일명 add 한것 취소
- git reset --hard: 지금까지 수정한 모든것 다 취소
- git diff: 변환된것들 확인
- git log --graph (--decorate --oneline): 커밋 로그를 그래프로 보여줌

터미널(쉘) 관련
- cd 이름: 이름으로 이동
- cd ..: 상위 폴더로 이동
- touch README.md: README.md 생성(touch .gitignore: .gitignore 생성)
- cat 이름.txt: 이름.txt 전체 출력
- mkdir 이름: 이름 폴더 생성
- pwd: 현재 위치 경로 출력
- ls: 현재 파일 리스트 보여줌
- ls -al: 현재 파일 리스트를 자세히 보여줌(숨겨진 파일 포함)
- tree: 현재 파일을 트리(그래프처럼?) 형식으로 보여줌
```

```
Xcode 관련

- command + shift + o: 원하는 페이지로 이동(페이지 이동도 되고 클래스, 함수로도 이동 가능)
- command + l: 원하는 라인으로 이동
- command + 1(숫자 1): 1번 네비게이터 이동

- command + o: 파일 열기
- command + d: 선택된 행을 복사해서 바로 아래에 붙여넣기(복제)
- command + f: 현제 페이지에서 검색

- command + shift + f: 전체에서 검색
- control + shift + 위, 아래 버튼: 여러개 동시에 선택해서 작성 가능
- control + shift + 마우스 클릭: 여러개 동시에 선택해서 작성 가능

- option + command + [: 행 전체 위로 올리기
- option + command + ]: 행 전체 아래로 내리기
- control + i: 코드 정리(들여쓰기)

- command + [: 왼쪽으로 코드 정리
- command + ]: 오른쪽으로 코드 정리

- option + command + 왼쪽 버튼: 코드 접기
- option + command + 오른쪽 버튼: 코드 풀기

- option + command + shift + 왼쪽 버튼: 메서드, 함수 접기
- option + command + shift + 오른쪽 버튼: 메서드, 함수 풀기

- control + shift + command + a: 코드 작성자 보기(깃으로)
- command + shift + r: clean build

- *(shift + 8) 하니까 선택된 단어를 찾아서 다음으로 이동함
- #(shift + 3) 하니까 선택된 단어를 찾아서 이전으로 이동함

- command + shift + L: 스토리보드에서 컴포넌트 검색
- 원하는 페이지 이동에서(command + shift + O) 이동할 페이지 검색 후 option + enter 하면 스토리보드 코드에 연결할 수 있도록 페이지 나뉨

Xcode 파일 복붙 관련

- 외부 파일을 프로젝트 안에 복사할 때(소스코드 파일같은): 복사할 곳에 마우스 오른쪽 -> view finder -> 파인더에서 저장할 위치 이동 -> 복사할 파일을 저장할 파인더 위치로 이동(복붙) -> 다시 프로젝트 마우스 오른쪽 -> Add Files to 선택 -> 아까 이동(복붙) 시킨 위치로 이동 -> 모두 선택한다음 -> Copy items if needed 선택, Create groups 선택, 타겟은 현재 타켓 선택 -> Add
- 간혹 파일 복사된것 처럼 보이는데 정장 프로젝트 폴더 안에 파일 없는 경우가 있음

- dylib 에러: no such file 이거나 dylib 에러 등 프레임워크를 pod install 했는데도 에러가 난다면 -> 버전 입력하는 General -> Frameworks, Libraries, and Embedded Content 에서 플러스 버튼 -> 프레임 워크 모두 선택 -> Add

- 프레임워크 수동으로 넣는 방법: 프레임워크는 압축형태가 아니라 폴더 형태 -> 바로 위에서 했던 방법으로 파일을 프로젝트에 복붙하고 -> 버전 입력하는 General 오른쪽에 -> Build Phases -> Embed Frameworks -> 플러스 버튼 -> 프레임 워크 모두 선택 -> Add
```

```
vim

Xcode에서는 : 명령어가 안됨. 그래서 기존 vim 명령어와 차이가 조금 있음
특히 한글일때는 작동 안함
기존과 동일하게 방향키, 복붙 가능한데 기본적으로 입력 모드 아니면 타이핑 안되니까 익숙해져야함

- h: 왼쪽이동, j: 아래이동, k: 위로이동, l:오른쪽이동
- x: 한글자 삭제

- dd: 행 삭제(붙여넣기 가능 - 오려두기와 같음)
- D: 현재 위치부터 끝까지 삭제(붙여넣기 가능 - 오려두기와 같음)

- p: 붙여넣기(아래로 한칸 내리면서)
- Y, yy: 행 복사

- control + u: 반페이지씩 위로 이동
- control + d: 반페이지씩 아래로 이동

- o: 한줄 아래로 내리면서 편집모드
- O: 한줄 올리면서 편집모드
- i: 커서 왼쪽으로 편집모드
- a: 커서 오른쪽으로 편집모드

- control + e: 한줄씩 아래로
- control + y: 한줄씩 위로

- v: 비주얼 모드로 블록 선택되도록 - cat 을 삭제한다고 하면 x 를 3번 눌러야 하지만 v 누르고 이동하면 선택됨, 그 상태에서 삭제하면 블록이 삭제
- V: 행 전체 선택

- w: 다음으로  단어별 이동, 단어 맨 앞글자로 이동
- b: 이전으로 단어별 이동, 단어 맨 앞글자로 이동 
- e: 다음으로  단어별 이동, 단어 맨 끝글자로 이동

- 0: 행에서 맨 뒤로
- $: 행에서 맨 앞으로
```

```
세팅

- 테마: High Contrast(Dark) / Osaka - 16.0 
- invisibles: 스페이스바, 엔터를 확인할 수 있음
- Vim Mode: vim 모드 활성화
- indexing 이 너무 오래 걸린다?: scheme 확인 - 간혹 sdk 로 설정되어 있을수 있음(재부팅, 껏켯 다 해봤는데 저 문제였음)
```

```
Visual Studio Code

- 폴더 열기: command + o 
- 새창 열기(새로운 창 띄우는거, 2개 따로 실행할때): command + shift + n
```

```
Item

- 새창 열기(새로운 창 띄우는거, 2개 따로 실행할때): command + n
```