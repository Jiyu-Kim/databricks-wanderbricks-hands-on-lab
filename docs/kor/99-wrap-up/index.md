# 마무리

## 주요 성과 🎯

여러분은 네 명의 페르소나가 되어, Wanderbricks의 원천 데이터부터 마케팅 임원이 직접 질문하는 AI까지 데이터 & AI 플랫폼을 엔드투엔드로 구축했습니다.

| Step | 페르소나 | 만든 것 |
|---|---|---|
| 1 | 🛠️ Daniel · Data Engineer | Lakeflow 파이프라인, Bronze·Silver·Gold 테이블 7개 |
| 2 | 📊 Ana · Data Analyst | 고객 360 AI/BI 대시보드 |
| 3 | 📊 Ana · Data Analyst | Metric View 2개 (`mv_bookings`, `mv_reviews`), Domain |
| 4 | 🤖 Aiden · AI Engineer | Genie Agent, Benchmark, Page 3개 (매출·실매출·성수기), Volume |
| 5 | 📈 Mina · Marketing Executive | Genie One에서 비즈니스 질문하기 |

## 학습 하이라이트 📚

- **선언적 파이프라인:** SQL 몇 줄로 수집, 데이터 품질 검증, 증분 처리를 구현했습니다.
- **한 번 정의한 KPI:** Metric View로 KPI를 한 번 정의하면 대시보드, SQL, Genie가 모두 같은 숫자를 사용합니다.
- **용어의 표준화:** Domain과 Page로 비즈니스 용어를 조직 전체가 같은 의미로 사용하게 했습니다.
- **측정 가능한 AI 품질:** Monitoring과 Benchmark로 AI가 틀리는 원인을 찾고, 개선 효과를 숫자로 확인했습니다.
- **정형 + 비정형:** Volume으로 문서와 데이터를 함께 분석했습니다.

## 다음 단계 🚀

| 주제 | 문서 |
|---|---|
| Lakeflow Spark Declarative Pipelines | [docs.databricks.com/aws/en/ldp](https://docs.databricks.com/aws/en/ldp/) |
| AI/BI 대시보드 | [docs.databricks.com/aws/en/dashboards](https://docs.databricks.com/aws/en/dashboards/) |
| Unity Catalog Semantics (Metric View, Domain, Page) | [docs.databricks.com/aws/en/uc-semantics](https://docs.databricks.com/aws/en/uc-semantics/) |
| Genie Agent | [docs.databricks.com/aws/en/genie](https://docs.databricks.com/aws/en/genie/) |
| Genie Agent Volumes | [docs.databricks.com/aws/en/genie-agents/volumes](https://docs.databricks.com/aws/en/genie-agents/volumes) |

## 리소스 정리하기

실습을 마쳤다면, 만든 자산을 아래 순서대로 삭제합니다. 다른 자산이 참조하는 자산을 나중에 삭제하도록 순서를 정했습니다.

!!! warning "본인의 자산만 삭제하세요"
    공유 워크스페이스에서는 이름에 `<your_name>`이 붙은 **본인의 자산만** 삭제합니다.

1. **Genie Agent:** **Genie Agents**에서 `<your_name> - Wanderbricks 마케팅 어시스턴트`의 케밥 메뉴(⋮) → **Delete**를 클릭합니다.

    ![Genie Agent 삭제](../assets/images/99-wrap-up/99-01-delete-genie-agent.png)

2. **대시보드:** **Dashboards**에서 `<your_name> - Wanderbricks Customer 360`의 케밥 메뉴(⋮) → **Move to trash**를 클릭합니다.

    ![대시보드 삭제](../assets/images/99-wrap-up/99-02-delete-dashboard.png)

3. **Page:** **Discover** → **Pages**에서 `매출`, `실매출`, `성수기` Page를 각각 열고, 케밥 메뉴(⋮) → **Delete**를 클릭합니다.

    ![Page 삭제](../assets/images/99-wrap-up/99-03-delete-page.png)

4. **Domain:** **Discover**에서 `<your_name>_wanderbricks_marketing` Domain을 열고, 케밥 메뉴(⋮) → **Delete**를 클릭합니다.

    ![Domain 삭제](../assets/images/99-wrap-up/99-04-delete-domain.png)

5. **Governed Tag:** **Catalog** → **Govern** → **Governed Tags**에서 `<your_name>_wanderbricks_marketing`의 케밥 메뉴(⋮) → **Delete**를 클릭합니다.

    ![Governed Tag 삭제](../assets/images/99-wrap-up/99-05-delete-governed-tag.png)

6. **파이프라인:** **Jobs & Pipelines**에서 `<your_name>_wanderbricks_customer_360`의 케밥 메뉴(⋮) → **Delete**를 클릭합니다.

    ![파이프라인 삭제](../assets/images/99-wrap-up/99-06-delete-pipeline.png)

7. **카탈로그:** **Catalog**에서 `<your_name>_wanderbricks_marketing`의 케밥 메뉴(⋮) → **Delete**를 클릭합니다. 카탈로그 안의 테이블, Metric View, Volume이 모두 함께 삭제됩니다.

    ![카탈로그 삭제](../assets/images/99-wrap-up/99-07-delete-catalog.png)

??? tip "SQL로 카탈로그 삭제하기"
    SQL Editor에서 아래 쿼리를 실행해도 카탈로그와 그 안의 모든 자산을 삭제할 수 있습니다. 삭제한 뒤에는 되돌릴 수 없으니 카탈로그 이름을 꼭 확인합니다.

    ```sql
    DROP CATALOG <your_name>_wanderbricks_marketing CASCADE;
    ```

## 피드백

이 실습에 대한 의견이나 개선할 점이 있다면 [GitHub Issues](https://github.com/Jiyu-Kim/databricks-wanderbricks-hands-on-lab/issues)에 남겨 주세요.

수고하셨습니다! 🎉
