# iOS_Practice
iOS Practice History

***

#### git 명령어 정리

```
브랜치 관련
- git branch: 브랜치 확인
- git branch -a: 원격 포함해서 전체 브랜치 확인
- git branch -r: 원격 브랜치 확인
- git switch 브랜치_이름: 브랜치_이름으로 브랜치 변경(이동) -- 차이가 뭐지..
- git checkout 브랜치_이름: 브랜치_이름으로 브랜치 변경(이동) -- 차이가 뭐지..
- git checkout -b 브랜치_이름: 브랜치_이름 으로 브랜치 만들고 브랜치 변경(이동)

설정 관련
- git config -l: 깃 설정 확인
- git config --local user.email 이메일: 이메일 등록(안하면 컴퓨터 이름으로 등록됨 / --local 추천)
- git config --local user.name 이름: 이름 등록(안하면 컴퓨터 이름으로 등록됨 / --local 추천)
- git remote -v: 깃 원격 주소 확인

커밋 관련
- git add .: 전체 스테이징
- git commit -m "커밋 메시지": 커밋 메시지로 커밋
- git push -u origin main: origin 이름의 main 브랜치로 푸시(-u 로 하면 다음부터는 git push 만 해도 자동으로 됨, 근데 그냥 매번 다 입력하는거 추천)
- git status: 변경사항 확인
- git log: 커밋 로그 확인

터미널(쉘) 관련
- cd 이름: 이름으로 이동
- cd ..: 상위 폴더로 이동
- touch README.md: README.md 생성(touch .gitignore: .gitignore 생성)
- cat 이름.txt: 이름.txt 전체 출력
- mkdir 이름: 이름 폴더 생성
- pwd: 현재 위치 출력
- ls: 현재 파일 리스트 보여줌
- ls -al: 현재 파일 리스트를 자세히 보여줌(숨겨진 파일 포함)
```