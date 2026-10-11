# 1.1) Bronze: 원천 데이터 수집

이 페이지에서는 파이프라인을 만들고, 원천 테이블 3개(`users`, `bookings`, `reviews`)를 원본 그대로 수집하는 Bronze 테이블을 정의합니다.

## 1단계 - 파이프라인 만들기

1. 왼쪽 사이드바 상단의 **New**를 클릭한 뒤 **ETL pipeline**을 클릭합니다.

    ![New > ETL pipeline](../assets/images/01-lakeflow-pipeline/1-1-01-new-etl-pipeline.png)

2. Lakeflow Pipelines Editor가 열립니다. 화면 상단의 파이프라인 이름을 클릭하고 `<your_name>_wanderbricks_customer_360`을 입력합니다. 예를 들어 이름이 Jiyu라면 `jiyu_wanderbricks_customer_360`을 입력합니다.

    ![파이프라인 이름 입력](../assets/images/01-lakeflow-pipeline/1-1-02-pipeline-name.png)

3. 파이프라인 이름 옆의 기본 카탈로그·스키마를 클릭합니다. 카탈로그는 사전 준비에서 만든 `<your_name>_wanderbricks_marketing`(예: `jiyu_wanderbricks_marketing`)을, 스키마는 `default`를 선택합니다. 파이프라인이 만드는 모든 테이블이 이 위치에 저장됩니다.

    ![기본 카탈로그와 스키마 선택](../assets/images/01-lakeflow-pipeline/1-1-03-default-catalog-schema.png)

4. 소스 코드 언어로 **SQL**을 선택합니다.

    ![언어 SQL 선택](../assets/images/01-lakeflow-pipeline/1-1-04-language-sql.png)

!!! info "컴퓨팅 설정"
    파이프라인은 기본적으로 **Serverless compute**와 **Unity Catalog**를 사용합니다. 이 실습에서는 기본 설정을 그대로 사용합니다.

## 2단계 - Bronze 파일 작성하기

1. 파일 브라우저에서 `my_transformation.sql`의 이름을 `bronze.sql`로 바꿉니다. 파일 이름에 마우스를 올리면 나타나는 케밥 메뉴(⋮)에서 **Rename**을 클릭합니다.

    ![파일 이름 바꾸기](../assets/images/01-lakeflow-pipeline/1-1-06-rename-file.png)

2. `bronze.sql`의 내용을 모두 지우고 아래 코드를 붙여넣습니다.

    ```sql title="bronze.sql"
    --8<-- "lab-files/kor/step1/bronze.sql"
    ```

    ![bronze.sql 작성](../assets/images/01-lakeflow-pipeline/1-1-07-bronze-code.png)

3. 아직 파이프라인을 실행하지 않습니다. Silver와 Gold 파일까지 작성한 뒤 [1.3)](1-3-run.md)에서 한 번에 실행합니다.

## 코드 이해하기

| 구문 | 설명 |
|---|---|
| `CREATE OR REFRESH STREAMING TABLE` | Streaming Table을 정의합니다. 파이프라인을 실행할 때마다 원천에 새로 들어온 데이터만 증분으로 처리합니다. |
| `FROM STREAM(samples.wanderbricks.users)` | 원천 테이블을 스트리밍 소스로 읽습니다. |
| `_ingested_at`, `_source` | 데이터가 언제, 어디에서 수집되었는지 기록하는 감사(audit) 컬럼입니다. |
| `TBLPROPERTIES ('quality' = 'bronze')` | 테이블이 어느 레이어에 속하는지 표시합니다. |

!!! tip "Bronze 레이어의 역할"
    Bronze 레이어는 원천 데이터를 **변경 없이 그대로** 보존합니다. 이후 정제 로직이 바뀌더라도 원본을 다시 수집할 필요 없이 Bronze에서 다시 처리할 수 있습니다.

!!! success "축하합니다!"
    파이프라인을 만들고 Bronze 테이블 3개를 정의했습니다. 다음 페이지에서 Silver와 Gold 테이블을 정의합니다.
