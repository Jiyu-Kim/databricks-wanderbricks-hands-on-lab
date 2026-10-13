# Wanderbricks Hands-on Lab

Databricks 데이터 & AI 플랫폼을 엔드투엔드로 실습하는 고객용 Hands-on Lab 가이드입니다. [Zensical](https://zensical.org)로 만든 정적 사이트이며, GitHub Pages로 배포합니다.

- **사이트:** https://jiyu-kim.github.io/databricks-wanderbricks-hands-on-lab/
- **한국어:** https://jiyu-kim.github.io/databricks-wanderbricks-hands-on-lab/kor/
- **English:** https://jiyu-kim.github.io/databricks-wanderbricks-hands-on-lab/eng/

## 저장소 구조

```
docs/
├── assets/images/<섹션>/   # 모든 이미지의 원본 (여기에만 넣습니다)
├── kor/                    # 한국어 페이지 (.md)
└── eng/                    # 영어 페이지 (.md)
lab-files/                  # 실습에서 사용하는 SQL·YAML 등 파일 (kor/eng)
scripts/build.sh            # 두 언어 사이트를 빌드하는 스크립트
zensical.kor.toml           # 한국어 사이트 설정과 메뉴(nav)
zensical.eng.toml           # 영어 사이트 설정과 메뉴(nav)
.github/workflows/          # GitHub Pages 자동 배포
```

- 섹션 폴더 이름은 언어와 관계없이 같습니다. 예: `01-lakeflow-pipeline`, `04-genie-agent`, `99-wrap-up`
- `docs/kor/assets/`, `docs/eng/assets/`는 빌드할 때 `docs/assets/`에서 자동으로 복사되며 git에 올라가지 않습니다. 이 두 폴더에는 파일을 직접 넣지 마세요.

## 배포 방식

`main` 브랜치에 push하면 GitHub Actions가 사이트를 빌드해서 GitHub Pages에 자동으로 배포합니다.

- 반영까지 1~2분 정도 걸립니다.
- 진행 상황은 저장소의 **Actions** 탭 → **Deploy to GitHub Pages**에서 확인합니다.
- 배포가 실패하면(빨간 ❌) 사이트는 이전 버전으로 유지됩니다. 로그를 확인해 고친 뒤 다시 push합니다.
- 다시 배포만 하고 싶을 때는 **Actions** → **Deploy to GitHub Pages** → **Run workflow**를 클릭합니다.

## 처음 한 번만: 작업 환경 준비

```bash
git clone https://github.com/Jiyu-Kim/databricks-wanderbricks-hands-on-lab.git
cd databricks-wanderbricks-hands-on-lab
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

push하려면 저장소 collaborator(write 권한)여야 합니다. 권한이 없다면 저장소 관리자에게 요청합니다.

## 공통 작업 흐름

어떤 작업이든 아래 순서를 따릅니다.

1. **최신 상태로 맞추기:** 작업을 시작하기 전에 `git pull`을 실행합니다.
2. **수정하기:** 아래 (1)~(3) 중 해당하는 작업을 합니다.
3. **로컬에서 미리 보기:**

    ```bash
    ZENSICAL=.venv/bin/zensical scripts/build.sh
    .venv/bin/zensical serve -f zensical.kor.toml -a localhost:8000
    ```

    - http://localhost:8000 에서 메뉴, 본문, 이미지를 확인합니다. 영어 사이트는 `zensical.eng.toml`로 실행합니다.
    - 빌드 로그 끝에 `No issues found`가 나오는지 확인합니다. 없는 페이지로 가는 링크가 있으면 `Warning: page does not exist`가 나옵니다.
    - 이미지 경로가 틀려도 빌드 경고는 나오지 않습니다. 이미지는 미리 보기 화면에서 직접 확인합니다.
    - 이미지를 추가하거나 바꿨다면 `scripts/build.sh`를 다시 실행해야 미리 보기에 반영됩니다.

4. **커밋하고 push하기:**

    ```bash
    git add -A
    git status                       # 의도한 파일만 들어갔는지 확인
    git commit -m "변경 내용 요약"
    git push origin main
    ```

    - push가 거부되면(`rejected`) 다른 사람이 먼저 push한 것입니다. `git pull`로 합친 뒤 다시 push합니다.

5. **사이트에서 확인하기:** 1~2분 뒤 사이트에서 변경 내용을 확인합니다.

## (1) 기존 페이지를 수정할 때

1. 수정할 페이지 파일을 엽니다. 예: `docs/kor/04-genie-agent/4-1-create.md`
2. 본문을 고칩니다.
    - 페이지는 단계별 번호 목록으로 쓰고, 단계마다 스크린샷을 넣습니다.
    - 영어 페이지(`docs/eng/` 아래 같은 경로)도 같은 내용으로 고쳐야 하는지 확인합니다.
3. **스크린샷을 바꿀 때:**
    - 같은 파일 이름으로 `docs/assets/images/<섹션>/`의 이미지를 덮어씁니다. 파일 이름이 같으면 본문은 고치지 않아도 됩니다.
    - 새 스크린샷을 추가할 때는 같은 폴더에 넣고 본문에서 이렇게 참조합니다.

        ```markdown
        ![설명](../assets/images/04-genie-agent/4-1-09-new-step.png)
        ```

4. **페이지 제목(메뉴 이름)을 바꿀 때:** 본문의 `#` 제목과 함께 `zensical.kor.toml`(영어는 `zensical.eng.toml`)의 `nav`에 적힌 메뉴 이름도 바꿉니다.
5. 공통 작업 흐름의 3~5단계(미리 보기, push, 확인)를 진행합니다.

## (2) 기존 페이지를 삭제할 때

1. 페이지 파일을 삭제합니다.

    ```bash
    git rm docs/kor/04-genie-agent/4-5-volumes.md
    git rm docs/eng/04-genie-agent/4-5-volumes.md   # 영어 페이지도 있다면
    ```

2. **메뉴에서 빼기:** `zensical.kor.toml`과 `zensical.eng.toml`의 `nav`에서 해당 항목을 지웁니다.

    ```toml
    # 지울 항목 (앞의 쉼표까지 함께 지웁니다)
    , { "4.5) (Optional) Volumes로 문서까지 분석하기" = "04-genie-agent/4-5-volumes.md" }
    ```

3. **이 페이지를 가리키는 링크 정리하기:** 다른 페이지에 남은 링크를 찾아 지우거나 고칩니다. Step 목차 표(예: `04-genie-agent/index.md`)도 함께 확인합니다.

    ```bash
    grep -rn "4-5-volumes" docs/kor docs/eng
    ```

4. **이미지 정리하기:** 이 페이지에서만 쓰던 이미지를 `docs/assets/images/<섹션>/`에서 삭제합니다. 삭제하기 전에 다른 페이지에서 쓰지 않는지 확인합니다.

    ```bash
    grep -rn "4-5-01-xxx.png" docs/kor docs/eng   # 결과가 없으면 삭제해도 됩니다
    git rm docs/assets/images/04-genie-agent/4-5-01-xxx.png
    ```

5. 공통 작업 흐름의 3~5단계를 진행합니다. 빌드 로그에 `page does not exist` 경고가 없는지 꼭 확인합니다.

## (3) 새로운 페이지를 추가할 때

1. **페이지 파일 만들기:** 해당 섹션 폴더에 `.md` 파일을 만듭니다.
    - 파일 이름은 기존 규칙을 따릅니다: `<스텝>-<번호>-<영문-이름>.md`. 예: `docs/kor/04-genie-agent/4-6-new-feature.md`
    - 영어 페이지도 필요하면 `docs/eng/04-genie-agent/4-6-new-feature.md`를 만듭니다.
    - 작성 형식은 같은 섹션의 기존 페이지(예: `4-5-volumes.md`)를 참고합니다.
2. **스크린샷 넣기:**
    - `docs/assets/images/<섹션>/`에 넣습니다. 파일 이름은 `<스텝>-<번호>-<순번>-<설명>.png` 규칙을 따릅니다. 예: `4-6-01-open-menu.png`
    - 본문에서는 `![설명](../assets/images/04-genie-agent/4-6-01-open-menu.png)`로 참조합니다.
3. **메뉴에 등록하기 (꼭 해야 합니다):** `zensical.kor.toml`의 `nav`에서 해당 섹션 목록 끝에 항목을 추가합니다. 등록하지 않으면 페이지가 메뉴에 나타나지 않습니다.

    ```toml
    { "4) Genie Agent 구축과 고도화" = ["04-genie-agent/index.md", ..., { "4.5) (Optional) Volumes로 문서까지 분석하기" = "04-genie-agent/4-5-volumes.md" }, { "4.6) 새 기능" = "04-genie-agent/4-6-new-feature.md" }] },
    ```

    - 영어 페이지를 만들었다면 `zensical.eng.toml`에도 같은 방식으로 등록합니다.
    - 새 섹션(새 Step)을 추가할 때는 `docs/kor/<새-섹션>/index.md`를 만들고, `nav`에 `{ "6) 새 섹션" = ["<새-섹션>/index.md", ...] }` 형태로 추가합니다.
4. **목차에 추가하기:** 섹션의 `index.md`에 페이지 목록 표가 있다면 새 페이지를 한 줄 추가합니다.
5. 공통 작업 흐름의 3~5단계를 진행합니다.

## 주의할 점

- **본인의 실습 자산 이름:** 가이드에서는 사용자 이름 자리에 `<your_name>`을 씁니다. 스크린샷을 찍을 때 쓴 실제 이름을 본문에 적지 않습니다.
- **스크린샷 속 정보:** 이 저장소와 사이트는 공개되어 있습니다. 스크린샷에 고객사 이름, 개인 정보, 토큰 등이 보이지 않는지 확인한 뒤 올립니다.
- **`site/` 폴더:** 로컬 빌드 결과물이며 git에 올라가지 않습니다. 배포는 GitHub Actions가 합니다.
