# 4.5) (Optional) Volumes로 문서까지 분석하기

이 페이지에서는 마케팅팀의 내부 문서(PDF)를 Unity Catalog Volume에 올리고 Genie Agent에 연결해, **문서와 데이터를 함께 봐야만 답할 수 있는 질문**을 해 봅니다.

| 질문 | 문서에서 얻는 것 | Metric View에서 얻는 것 |
|---|---|---|
| 캠페인 타깃 국가들의 실적이 목표 대비 어땠어? | 캠페인 기간, 타깃 국가, 국가별 목표치 | 국가별 예약 건수와 실매출 |
| 환불 정책 개정 후 취소율이 예상 범위 안에 있어? | 시행일, 예상 영향, 재검토 기준 | 월별 취소율 |

!!! warning "사전 조건"
    이 페이지는 **Analyze Files in Volumes with Genie Agents** Preview가 활성화되어 있고, 워크스페이스에서 **Lakebase**를 사용할 수 있어야 합니다. [사전 준비](../00-introduction/prerequisites.md#21-analyze-files-in-volumes-with-genie-agents)에서 확인합니다.

## 1단계 - 실습 파일 내려받기

아래 PDF 2개를 내려받습니다.

| 파일 | 내용 |
|---|---|
| [:material-file-pdf-box: 2025_Summer_Escape_캠페인_브리프.pdf](../assets/files/2025_Summer_Escape_캠페인_브리프.pdf) | 2025년 여름 성수기 캠페인의 기간, 타깃 국가 5개, 국가별 목표 예약 건수·실매출, 채널별 예산 |
| [:material-file-pdf-box: 환불_취소_정책_개정_공지_2025-07.pdf](../assets/files/환불_취소_정책_개정_공지_2025-07.pdf) | 2025년 7월 1일 시행된 무료 취소 기한 완화 정책, 예상 영향, 재검토 기준 |

## 2단계 - Volume 만들고 파일 올리기

1. **Catalog**에서 `<your_name>_wanderbricks_marketing` → `default` 스키마를 클릭한 뒤, 우측 상단의 **Create** → **Volume**을 클릭합니다.

    ![Create > Volume](../assets/images/04-genie-agent/4-5-01-create-volume.png)

2. **Volume name**에 `marketing_docs`를 입력하고, **Volume type**은 **Managed volume**을 선택한 뒤 **Create**를 클릭합니다.

    ![Volume 입력](../assets/images/04-genie-agent/4-5-02-volume-form.png)

3. 만들어진 Volume 화면에서 우측 상단의 **Upload to this volume**을 클릭하고, 1단계에서 내려받은 PDF 2개를 올립니다.

    ![파일 업로드](../assets/images/04-genie-agent/4-5-03-upload-files.png)

4. Volume에 PDF 2개가 올라간 것을 확인합니다.

    ![업로드된 파일](../assets/images/04-genie-agent/4-5-04-uploaded-files.png)

## 3단계 - Genie Agent에 Volume 연결하기

1. Genie Agent 화면 우측 상단의 **Configure**를 클릭한 뒤 **Sources** 탭에서 **Add**를 클릭합니다.

    ![Configure > Sources > Add](../assets/images/04-genie-agent/4-5-05-add-source.png)

2. 메뉴에서 **Volume**을 선택합니다. 검색창에 `marketing_docs`를 입력하고, 본인 카탈로그(`<your_name>_wanderbricks_marketing.default`)의 `marketing_docs`를 선택한 뒤 **Confirm**을 클릭합니다.

    !!! info "메뉴에 Volume이 보이지 않는다면"
        **Add** 메뉴에 **Table**, **Metric View**, **SQL function**만 보인다면 **Analyze Files in Volumes with Genie Agents** Preview가 활성화되지 않은 것입니다. 워크스페이스 관리자에게 활성화를 요청합니다. Volume을 선택하고 **Confirm**을 눌렀는데 Sources 목록에 Volume이 추가되지 않는다면, 워크스페이스에서 Lakebase를 사용할 수 없는 경우입니다.

    ![Volume 선택](../assets/images/04-genie-agent/4-5-06-select-volume.png)

3. **Sources** 목록에 `marketing_docs`가 **Indexing…** 상태로 추가됩니다. `marketing_docs` 오른쪽의 연필 아이콘을 클릭하면 **Content Search Status**에서 **Indexing in progress**를 확인할 수 있습니다. Genie가 문서를 읽을 수 있도록 색인하는 과정으로, 몇 분 정도 걸립니다.

    ![Volume 색인 중](../assets/images/04-genie-agent/4-5-06b-indexing.png)

    !!! warning "색인이 끝난 뒤 질문하세요"
        색인이 끝나기 전에 질문하면 Genie가 문서 내용을 찾지 못할 수 있습니다. **Sources** 목록의 상태가 **Indexing…** 상태에서 **Indexed**로 바뀐 것을 확인한 뒤 4단계로 넘어갑니다.

    ![Volume 색인 완료](../assets/images/04-genie-agent/4-5-06c-indexed.png)

4. 같은 화면의 **Description** 옆 연필 아이콘을 클릭하고, 아래 내용을 입력한 뒤 **Save**를 클릭합니다. Genie는 이 설명을 보고 어떤 질문에 문서를 참고할지 판단합니다.

    ```text
    Wanderbricks 마케팅 내부 문서. 2025 Summer Escape 캠페인 브리프(기간·타깃 국가·국가별 목표 예약 건수/실매출·채널 예산)와 2025-07 환불·취소 정책 개정 공지(시행일·변경 내용·예상 영향·재검토 기준).
    ```

    ![Volume Description 입력](../assets/images/04-genie-agent/4-5-07-volume-description.png)

## 4단계 - Agent 모드로 질문하기

!!! warning "Agent 모드에서만 문서를 참고합니다"
    **Chat** 모드에서는 Genie가 Volume의 문서를 읽지 않아 "목표치 정보가 없다"고 답합니다. 문서와 데이터를 함께 분석하려면 반드시 **Agent** 모드로 질문합니다.

1. **Configure** 패널을 닫고 우측 상단의 **New chat** 아이콘을 클릭한 뒤, 입력창 아래의 모드 토글에서 **Agent**가 선택되어 있는지 확인합니다.

    ![Agent 모드 선택](../assets/images/04-genie-agent/4-5-08-agent-mode.png)

2. 아래 질문을 입력합니다.

    !!! prompt "프롬프트"
        ```text
        Summer Escape 2025 캠페인 타깃 국가들의 캠페인 기간 예약 건수와 실매출이 목표 대비 어땠어?
        ```

3. Genie가 캠페인 브리프에서 기간(2025-06-01 ~ 2025-07-31)과 국가별 목표치를 찾고, Metric View에서 실적을 조회해 비교하는지 확인합니다. 답변 아래의 **Sources**에 문서가 출처로 표시됩니다.

    | 국가 | 목표 (예약 / 실매출) | 실적 (예약 / 실매출) | 결과 |
    |---|---|---|---|
    | UNITED STATES | 800건 / $55K | 870건 / $61.2K | 달성 |
    | GERMANY | 200건 / $18K | 235건 / $20.8K | 달성 |
    | JAPAN | 400건 / $28K | 326건 / $16.6K | 미달 |
    | UNITED KINGDOM | 200건 / $12K | 158건 / $7.8K | 미달 |
    | SOUTH KOREA | 150건 / $9K | 115건 / $5.5K | 미달 |

    ![캠페인 질문 답변](../assets/images/04-genie-agent/4-5-09-campaign-answer.png)

4. 새 대화에서 Agent 모드로 아래 질문을 입력합니다.

    !!! prompt "프롬프트"
        ```text
        7월 환불 정책 개정 이후 취소율이 정책 문서에서 예상한 범위 안에 있어?
        ```

5. Genie가 정책 공지에서 예상 영향(+3%p 이내)과 재검토 기준(+5%p 초과)을 찾고, 취소율이 6월 약 20.4%에서 7월 약 28.8%로 **+8.4%p** 올라 재검토 대상이라고 답하는지 확인합니다.

    ![정책 질문 답변](../assets/images/04-genie-agent/4-5-10-policy-answer.png)

!!! success "축하합니다!"
    Aiden의 업무를 마쳤습니다. 정형 데이터(Metric View)와 비정형 문서(PDF)를 함께 분석하는 Genie Agent를 완성했습니다. 다음 Step에서는 Mina가 되어 Genie One에서 질문해 봅니다.
