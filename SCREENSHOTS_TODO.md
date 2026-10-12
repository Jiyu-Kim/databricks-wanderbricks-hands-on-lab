# Screenshots TODO

가이드 본문에 자리만 잡아 둔 스크린샷 목록입니다. 아래 경로에 같은 파일명으로 저장하면 본문에 바로 반영됩니다.

- 저장 위치: `docs/assets/images/<섹션>/`
- UI 언어: English (한국어·영어 가이드 공용)
- 예시 이름: `<your_name>` = `jiyu` (예: 카탈로그 `jiyu_wanderbricks_marketing`)
- 클릭 대상은 빨간 사각형(필요하면 화살표)으로 표시

## 00-introduction / prerequisites.md

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| prereq-01-catalog-menu.png | 왼쪽 사이드바 | **Catalog** 메뉴 |✅ |
| prereq-02-create-catalog-menu.png | Catalog 화면 상단 **+** 버튼을 누른 상태 | **+** 버튼, **Create a catalog** 메뉴 |✅ |
| prereq-03-warehouse-list.png | SQL Warehouses 목록 | 사용할 Warehouse 행 |✅ |
| prereq-04-warehouse-permissions.png | Warehouse 상세 → Permissions 다이얼로그 | 본인/그룹의 **Can use** 권한 |✅ |
| prereq-05-govern-menu.png | Catalog 화면 상단 **Govern** 드롭다운을 연 상태 | **Govern** 버튼, **Governed Tags** |✅ |
| prereq-06-governed-tags-permissions.png | Governed Tags → **Account Permissions** 탭 | 탭, 본인/그룹의 **CREATE** 권한 |✅ |
| prereq-07-create-domain-button.png | Discover 화면 | **Create domain** 버튼 |✅ |
| prereq-08-previews-menu.png | 우측 상단 사용자 메뉴를 연 상태 | **Previews** |✅ |
| prereq-09-preview-discover-page.png | Previews 페이지에서 `Discover Page` 검색 | 검색창, 토글 |✅ |
| prereq-10-preview-genie-volumes.png | Previews 페이지에서 `Analyze Files in Volumes with Genie Agents` 검색 | 검색창, 토글 |✅ |
| prereq-11-preview-ontology-snippets.png | Previews 페이지에서 `Genie Ontology snippets` 검색 | 검색창, 토글 |✅ |
| prereq-12-sidebar-discover.png | 왼쪽 사이드바 | **Discover** 메뉴 |✅ |
| prereq-13-create-catalog-dialog.png | Create a new catalog 다이얼로그 (`jiyu_wanderbricks_marketing` 입력) | Catalog name, Type, **Create** 버튼 |✅ |
| prereq-14-catalog-created.png | 카탈로그 생성 완료 다이얼로그 (Catalog created!) | **View catalog** 버튼 | ✅ |
| prereq-15-catalog-default-schema.png | 생성한 카탈로그 화면 | `default` 스키마 |✅ |
| prereq-16-samples-wanderbricks.png | Catalog → samples → wanderbricks 펼친 상태 | `users`, `bookings`, `reviews` |✅ |
| prereq-17-sql-editor-menu.png | 왼쪽 사이드바 | **SQL Editor** 메뉴 |✅ |
| prereq-18-sql-editor-warehouse.png | SQL Editor 우측 상단 Warehouse 선택 메뉴를 연 상태 | Warehouse 선택 메뉴 |✅ |
| prereq-19-sample-count-result.png | 건수 조회 쿼리 실행 결과 | **Run** 버튼, 결과 표 |✅ |

## 01-lakeflow-pipeline

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 1-1-01-new-etl-pipeline.png | 사이드바 **New** 메뉴를 연 상태 | **New**, **ETL pipeline** | ✅ |
| 1-1-02-pipeline-name.png | Lakeflow Pipelines Editor 상단 | 파이프라인 이름 `jiyu_wanderbricks_customer_360` | ✅ |
| 1-1-03-default-catalog-schema.png | 기본 카탈로그·스키마 선택 팝업 | `jiyu_wanderbricks_marketing` / `default` | ✅ |
| 1-1-04-language-sql.png | 언어 선택 | **SQL** | ✅ |
| 1-1-06-rename-file.png | 파일 케밥 메뉴 | **Rename** | ✅ |
| 1-1-07-bronze-code.png | `bronze.sql` 편집기 | 파일 이름, 코드 영역 | ✅ |
| 1-2-01-add-transformation.png | `transformations` 옆 **+** 메뉴 | **+**, **Transformation** | ✅ |
| 1-2-02-create-silver-file.png | 새 파일 다이얼로그 (`silver`, SQL) | 파일 이름, 언어, **Create** | ✅ |
| 1-2-03-silver-code.png | `silver.sql` 편집기 | 파일 이름 | ✅ |
| 1-2-04-create-gold-file.png | 새 파일 다이얼로그 (`gold`, SQL) | 파일 이름, 언어, **Create** | ✅ |
| 1-2-05-gold-code.png | `gold.sql` 편집기 | 파일 이름 | ✅ |
| 1-2-06-three-files.png | 파일 브라우저 | `bronze.sql`, `silver.sql`, `gold.sql` | ✅ |
| 1-3-01-run-pipeline.png | 편집기 상단 | **Run pipeline** | ✅ |
| 1-3-02-run-completed.png | 실행 완료 상태 | **Completed** 상태 | ✅ |
| 1-3-03-pipeline-graph.png | 하단 **Pipeline graph** 탭 | 탭, 7개 노드 | ✅ |
| 1-3-04-graph-preview.png | `gold_customer_360` 노드 클릭 후 미리보기 | 노드, 미리보기 영역 | ✅ |
| 1-3-05-tables-tab.png | 하단 **Tables** 탭 | 탭, 행 수 컬럼 | ✅ |
| 1-3-06-01-expectations.png | `silver_dim_users` Expectations 결과 (1) | 위반 건수 | ✅ |
| 1-3-06-02-expectations.png | `silver_dim_users` Expectations 결과 (2) | 위반 건수 | ✅ |
| 1-3-07-catalog-tables.png | Catalog Explorer `jiyu_wanderbricks_marketing.default` | 테이블 7개 | ✅ |
| 1-3-08-gold-overview.png | `gold_customer_360` **Overview** 탭 | 컬럼 코멘트, PK | ✅ |
| 1-3-09-gold-sample-data.png | `gold_customer_360` **Sample Data** 탭 | 탭 | ✅ |

## 02-aibi-dashboard

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 2-1-01-new-dashboard.png | New > Dashboard | (본문 지시문 참고) | ✅ |
| 2-1-02-dashboard-name.png | 대시보드 이름 입력 | (본문 지시문 참고) | ✅ |
| 2-1-03-data-tab.png | Data 탭 | (본문 지시문 참고) | ✅ |
| 2-1-04-create-from-sql.png | Create from SQL | (본문 지시문 참고) | ✅ |
| 2-1-05-dataset-run.png | 데이터셋 쿼리 실행 결과 | (본문 지시문 참고) | ✅ |
| 2-1-06-dataset-rename.png | 데이터셋 이름 바꾸기 | (본문 지시문 참고) | ✅ |
| 2-1-07-canvas-tab.png | Canvas 탭 | (본문 지시문 참고) | ✅ |
| 2-1-08-rename-page-1.png | 첫 번째 탭 이름 바꾸기 | (본문 지시문 참고) | ✅ |
| 2-1-09-add-page-2.png | 두 번째 탭 추가 | (본문 지시문 참고) | ✅ |
| 2-2-01-page-1.png | ① 직접 만들기 탭 | `① 직접 만들기` 탭 | ✅ |
| 2-2-02-add-visualization.png | Add a visualization | **Add a visualization** | ✅ |
| 2-2-03-counter-type.png | Counter 선택 | Visualization **Counter**, 데이터셋 | ✅ |
| 2-2-04-counter-value.png | Counter Value 설정 | `COUNT(user_id)` | ✅ |
| 2-2-05-counter-title.png | Counter 제목 입력 | **Title**, 제목 | ✅ |
| 2-2-06-counter-result.png | 총 고객 수 위젯 | Counter 위젯 | ✅ |
| 2-2-07-add-bar.png | 두 번째 위젯 배치 | **Add a visualization** | ✅ |
| 2-2-08-bar-type.png | Bar 선택 | Visualization **Bar** | ✅ |
| 2-2-09-bar-axes.png | Bar 축 설정 | X axis, Y axis | ✅ |
| 2-2-10-bar-title.png | Bar 제목 입력 | **Title**, 제목 | ✅ |
| 2-2-11-bar-result.png | 세그먼트별 생애 지출 위젯 | Bar 위젯 | ✅ |
| 2-2-12-add-line.png | 세 번째 위젯 배치 | **Add a visualization**, 새 위젯 | ✅ |
| 2-2-13-line-type.png | Line 선택 | Visualization, **Line** | ✅ |
| 2-2-14-line-axes.png | Line 축 설정 | X axis, Y axis | ✅ |
| 2-2-15-line-title.png | Line 제목 입력 | **Title**, 제목 | ✅ |
| 2-2-16-line-result.png | 월별 최근 예약 고객 수 위젯 | Line 위젯 | ✅ |
| 2-2-17-layout.png | 완성된 ① 직접 만들기 탭 | 위젯 3개 | ✅ |
| 2-3-01-page-2.png | ② Genie Code로 만들기 탭 | `② Genie Code로 만들기` 탭 | ✅ |
| 2-3-02-open-genie-code.png | Genie Code 패널 열기 | **Genie Code** 아이콘, 입력창 | ✅ |
| 2-3-03-prompt.png | 프롬프트 입력 | 프롬프트, 전송 버튼 | ✅ |
| 2-3-04-generating.png | Genie Code가 위젯을 만드는 중 | 진행 단계(Thinking) | ✅ |
| 2-3-05-result.png | Genie Code가 만든 위젯 | 생성된 위젯 | ✅ |
| 2-3-06-accept.png | 후속 요청으로 위젯 수정 | 후속 요청, 수정 결과, 수정된 위젯 | ✅ |
| 2-3-07-publish.png | Publish | **Publish** | ✅ |
| 2-3-08-published.png | 게시된 대시보드 | **Edit draft**, 게시된 페이지 탭 | ✅ |

## 03-uc-semantics

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 3-1-01-default-schema.png | default 스키마 | `default` 스키마 | ✅ |
| 3-1-02-create-metric-view.png | Create > Metric view | **Create**, **Metric view** | ✅ |
| 3-1-03-metric-view-name.png | Metric View 이름 입력 | Name 입력란, **Create** | ✅ |
| 3-1-04-yaml-editor.png | YAML 붙여넣기 | YAML 보기 토글(`<>`), YAML 편집기 | ✅ |
| 3-1-05-overview.png | mv_bookings Overview | Measures (6), Fields (8) | ✅ |
| 3-1-06-query-total.png | 전체 KPI 조회 결과 | **Run all**, 결과 표 | ✅ |
| 3-1-07-query-by-segment.png | 고객 유형별 조회 결과 | **Run all**, 결과 표 | ✅ |
| 3-2-01-create-metric-view.png | Create > Metric view | **Create**, **Metric view** | ✅ |
| 3-2-02-metric-view-name.png | Metric View 이름 입력 | Name 입력란, **Create** | ✅ |
| 3-2-03-yaml-editor.png | YAML 붙여넣기 | YAML 보기 토글(`<>`), YAML 편집기 | ✅ |
| 3-2-04-overview.png | mv_reviews Overview | Measures (4), Fields (5) | ✅ |
| 3-2-05-query-total.png | 리뷰 KPI 조회 결과 | **Run all**, 결과 표 | ✅ |
| 3-3-04-create-domain.png | Discover > Create domain | **Create**, **Create domain** | ✅ |
| 3-3-06-domain-form.png | Domain 정보 입력 | Source(**New tag**), 이름, Subtitle, Description, **Create** | ✅ |
| 3-3-07-publish-domain.png | Domain Publish | **Draft**, **Publish** | ✅ |
| 3-3-08-open-mv-bookings.png | mv_bookings 열기 | `mv_bookings` | ✅ |
| 3-3-09-add-tags.png | Add tags | **Add tags** | ✅ |
| 3-3-10-select-tag-save.png | Tag 선택 후 저장 | Key, **Save** | ✅ |
| 3-3-11-tag-mv-reviews.png | mv_reviews Tag 연결 | 연결된 Tag | ✅ |
| 3-3-12-open-domain.png | Domain 선택 | **Domain** 필터, 본인 Domain | ✅ |
| 3-3-13-domain-assets.png | Domain에 연결된 Metric View | Metric View 2개 | ✅ |

## 04-genie-agent

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 4-1-01-new-genie-agent.png | Genie Agents > New | **Genie Agents**, **New** | ✅ |
| 4-1-02-select-sources.png | Metric View 2개 선택 | **Metric views** 필터, Metric View 2개, **Create** | ✅ |
| 4-1-03-settings-tab.png | Configure > About | **Configure**, **About** 탭 | ✅ |
| 4-1-04-settings-form.png | Edit agent details | Name, Default warehouse, **Save** | ✅ |
| 4-1-04b-description.png | Description 입력 | Description 입력란, **Save** | ✅ |
| 4-1-05-instructions.png | Instructions 입력 | **Instructions** 탭, 입력란, **Save** | ✅ |
| 4-1-06-sample-question.png | Sample question 추가 | **Add**, 추가된 질문, **Save** | ✅ |
| 4-1-07-click-sample.png | 추천 질문 클릭 | **Chat**, 추천 질문 | ✅ |
| 4-1-08-first-answer.png | 첫 질문 답변 | 답변 요약, 차트 | ✅ |
| 4-1-09-show-code.png | 생성된 SQL | **Hide code**, `MEASURE(`예약 건수`)` | ✅ |
| 4-2-01-new-chat.png | New chat | New chat 아이콘 | ✅ |
| 4-2-02-ask-revenue.png | 질문 입력 | 질문 입력란, 전송 버튼 | ✅ |
| 4-2-03-revenue-answer.png | 매출 질문 답변 | 답변 요약, `MEASURE(`총 예약 금액`)`, INDIA | ✅ |
| 4-2-04-thumbs-down.png | 👎 클릭 | **Is this useful?**, 👎 | ✅ |
| 4-2-05-feedback-comment.png | 피드백 코멘트 입력 | **Drew wrong conclusions**, What went wrong?, **Submit** | ✅ |
| 4-2-06-monitor-tab.png | Monitor 탭 | **Monitor** | ✅ |
| 4-2-07-feedback-list.png | 피드백 받은 질문 | **Thumbs down** 1, Bad 행 | ✅ |
| 4-2-08-feedback-detail.png | 피드백 상세 | 질문, **Show code**, 코멘트 | ✅ |
| 4-3-01-benchmarks-tab.png | Benchmark 탭 | **Benchmark** | ✅ |
| 4-3-02-add-benchmark.png | Add benchmark | **Mode: Agent**, **Add benchmark** | ✅ |
| 4-3-03-benchmark-form.png | Benchmark 질문과 정답 SQL | Question, **Run**, Ground truth SQL, Preview 8001, **Add benchmark** | ✅ |
| 4-3-04-run-benchmarks.png | Run benchmarks | **Run all benchmarks** | ✅ |
| 4-3-05-benchmark-bad.png | Benchmark 결과 Bad | **0% accurate (0/1)**, 질문 | ✅ |
| 4-3-06-benchmark-detail.png | Genie SQL과 정답 SQL 비교 | Assessment, Score reason, Failure analysis | ✅ |
| 4-4-01-open-mv-bookings.png | mv_bookings 열기 | `mv_bookings`, **Edit** | ✅ |
| 4-4-02-edit-mode.png | Edit 화면 | **UI**, Measures (6), Fields (8) | ✅ |
| 4-4-03-add-measure.png | Add measure | **+** (Add measure) | ✅ |
| 4-4-04-expression-custom.png | Expression Custom | **Custom** | ✅ |
| 4-4-05-measure-revenue.png | 매출 measure 입력 | Custom, 입력값 전체 | ✅ |
| 4-4-06-measure-net-revenue.png | 실매출 measure 입력 | Custom, 입력값 전체 | ✅ |
| 4-4-07-add-field.png | Add field | **+** (Add field), **Custom** | ✅ |
| 4-4-08-field-peak-season.png | 성수기 여부 field 입력 | Custom, 입력값 전체 | ✅ |
| 4-4-09-field-checkin-year.png | 체크인 연도 field 입력 | Custom, 입력값 전체 | ✅ |
| 4-4-10-select-gbv.png | 총 예약 금액 선택 | `총 예약 금액` | ✅ |
| 4-4-11-gbv-comment.png | 총 예약 금액 Comment 수정 | Comment | ✅ |
| 4-4-12-save.png | Save | **Save**, Measures (8), Fields (10) | ✅ |
| 4-4-13-verify-query.png | 확인 쿼리 결과 | **Run all**, 결과 표 | ✅ |
| 4-4-14-discover-pages.png | Discover | **Discover** | ✅ |
| 4-4-15-create-page.png | Create page | **Create**, **Create page** | ✅ |
| 4-4-16-page-form.png | Page 입력 | 이름, Domain, Synonyms, Description, 본문 | ✅ |
| 4-4-17-page-publish.png | Page Publish | **Publish** | ✅ |
| 4-4-18-rerun-benchmarks.png | Run benchmarks | **Benchmark**, **Run all benchmarks** | ✅ |
| 4-4-19-benchmark-good.png | Benchmark 결과 Good | **100% accurate (1/1)**, **Good**, WHERE 조건 | ✅ |
| 4-4-20-revenue-after.png | 개선 후 매출 답변 | 답변 요약, `MEASURE(`매출`)`, INDIA | ✅ |
| 4-5-01-create-volume.png | Create > Volume | **Create**, **Volume** | ✅ |
| 4-5-02-volume-form.png | Volume 입력 | Volume name, Managed volume, 카탈로그·스키마, **Create** | ✅ |
| 4-5-03-upload-files.png | 파일 업로드 | 선택한 파일, **Upload** | ✅ |
| 4-5-04-uploaded-files.png | 업로드된 파일 | PDF 2개 | ✅ |
| 4-5-05-add-source.png | Configure > Sources > Add | **Configure**, **Sources**, **Add** | ✅ |
| 4-5-06-select-volume.png | Volume 선택 | **Volumes** 필터, `marketing_docs`, **Confirm** | ✅ |
| 4-5-06b-indexing.png | Volume 색인 중 (Content Search Status) | **Indexing…**, Indexing in progress | ✅ |
| 4-5-06c-indexed.png | Volume 색인 완료 | **Indexed** | ✅ |
| 4-5-07-volume-description.png | Volume Description 입력 | Description 입력란, **Save** | ✅ |
| 4-5-08-agent-mode.png | Agent 모드 선택 | New chat 아이콘, **Agent** | ✅ |
| 4-5-09-campaign-answer.png | 캠페인 질문 답변 | 요약 문장, 국가별 목표 대비 실적 표 | ✅ |
| 4-5-10-policy-answer.png | 정책 질문 답변 | 결론, 6월→7월 취소율 변화 | ✅ |

## 05-genie-one

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 5-01-open-genie-one.png | Genie One 열기 | **Genie One** | ✅ |
| 5-02-genie-one-home.png | Genie One 화면 | 입력창 | ✅ |
| 5-03-ask-revenue-definition.png | 질문 입력 | 질문, 전송 버튼 | ✅ |
| 5-04-revenue-answer.png | 매출·실매출 답변 | 매출·실매출 금액, 정의 표 | ✅ |
| 5-05-page-citation.png | Page citation | **Genie Ontology (2)**, 매출·실매출 | ✅ |
| 5-06-click-citation.png | citation 클릭 | **매출** | ✅ |
| 5-07-page-opened.png | 매출 Page | `매출` Page 패널 | ✅ |
| 5-08-peak-season-answer.png | 성수기 답변 | 성수기 정의, 8,001건 | ✅ |

## 99-wrap-up

| 파일명 | 캡처할 화면 | 빨간 박스로 표시할 곳 | 상태 |
|---|---|---|---|
| 99-01-delete-genie-agent.png | Genie Agent 삭제 | Data Room actions(⋮), Move to trash | ✅ |
| 99-02-delete-dashboard.png | 대시보드 삭제 | More actions(⋮) → File actions → Move to trash | ✅ |
| 99-03-delete-page.png | Page 삭제 | Page ⋮, Delete | ✅ |
| 99-04-delete-domain.png | Domain 삭제 | Edit, Remove domain | ✅ |
| 99-05-delete-governed-tag.png | Governed Tag 삭제 | Delete 버튼 | ✅ |
| 99-06-delete-pipeline.png | 파이프라인 삭제 | 행 ⋮, Delete | ✅ |
| 99-07-delete-catalog.png | 카탈로그 삭제 | 카탈로그 ⋮, Delete | ✅ |
