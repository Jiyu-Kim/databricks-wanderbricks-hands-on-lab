# 사전 준비

이 페이지에서는 실습에 필요한 권한과 Preview 기능을 확인하고, 실습 전체에서 사용할 카탈로그를 만든 뒤 샘플 데이터를 확인합니다.

!!! warning "공유 워크스페이스에서 실습하는 경우"
    - 여러 사람이 같은 워크스페이스에서 실습한다면, 이 실습에서 만드는 자산의 이름에 반드시 **본인 이름**을 붙여 다른 사람의 자산과 구분합니다.
    - 다른 사람이 만든 카탈로그, 대시보드, Genie Agent 등은 **수정하거나 삭제하지 않습니다.**

## 1단계 - 필요한 권한 확인하기

아래 네 가지 권한이 있는지 차례로 확인합니다. 권한이 없다면 워크스페이스 관리자에게 요청합니다.

| 권한 | 사용하는 곳 | 확인 방법 |
|---|---|---|
| 카탈로그 생성 | 사전 준비 3단계 | [1.1) 카탈로그 생성 권한](#11) |
| SQL Warehouse 사용 | Step 2 ~ 5 | [1.2) SQL Warehouse 사용 권한](#12-sql-warehouse) |
| Governed Tag 생성 | Step 3 (Domain 만들기) | [1.3) Governed Tag 생성 권한](#13-governed-tag) |
| Domain 생성 | Step 3 (Domain 만들기) | [1.4) Domain 생성 권한](#14-domain) |

### 1.1) 카탈로그 생성 권한

1. 왼쪽 사이드바에서 **Catalog**를 클릭합니다.

    ![Catalog 메뉴](../assets/images/00-introduction/prereq-01-catalog-menu.png)

2. **Catalog** 화면 상단의 **+** 버튼을 클릭합니다. **Create a catalog** 메뉴가 활성화되어 있으면 카탈로그를 만들 수 있습니다.

    ![Create a catalog 메뉴](../assets/images/00-introduction/prereq-02-create-catalog-menu.png)

### 1.2) SQL Warehouse 사용 권한

1. 왼쪽 사이드바에서 **SQL Warehouses**를 클릭합니다. 사용할 수 있는 SQL Warehouse(예: **Serverless Starter Warehouse**)가 목록에 보이는지 확인합니다.

    ![SQL Warehouses 목록](../assets/images/00-introduction/prereq-03-warehouse-list.png)

2. 사용할 SQL Warehouse를 클릭한 뒤 우측 상단의 **Permissions**를 클릭합니다. 본인 또는 본인이 속한 그룹이 **Can use** 이상의 권한을 가지고 있는지 확인합니다.

    ![SQL Warehouse Permissions](../assets/images/00-introduction/prereq-04-warehouse-permissions.png)

### 1.3) Governed Tag 생성 권한

Step 3에서 Domain을 만들면 같은 이름의 Governed Tag가 함께 만들어지므로, Governed Tag 생성 권한이 필요합니다.

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤, 상단의 **Govern** 버튼(방패 아이콘)을 클릭하고 **Governed Tags**를 선택합니다.

    ![Govern > Governed Tags 메뉴](../assets/images/00-introduction/prereq-05-govern-menu.png)

2. **Account Permissions** 탭을 클릭합니다. 본인 또는 본인이 속한 그룹에 **CREATE** 권한이 있는지 확인합니다.

    ![Governed Tags > Account Permissions](../assets/images/00-introduction/prereq-06-governed-tags-permissions.png)

!!! info
    워크스페이스 관리자는 기본적으로 Governed Tag 생성 권한을 가지고 있습니다.

### 1.4) Domain 생성 권한

1. 왼쪽 사이드바에서 **Discover**를 클릭한 뒤, 우측 상단의 **Create**를 클릭합니다. **Create domain** 메뉴가 보이면 Domain을 만들 수 있습니다.

    ![Discover > Create domain 버튼](../assets/images/00-introduction/prereq-07-create-domain-button.png)

!!! info
    Domain을 만들려면 `MANAGE DISCOVERY` 권한이 필요합니다. 계정 관리자와 워크스페이스 관리자는 기본적으로 이 권한을 가지고 있습니다. 왼쪽 사이드바에 **Discover** 메뉴 자체가 보이지 않는다면, 다음 2단계의 **Discover Page** Preview가 활성화되어 있지 않은 것입니다.

## 2단계 - Preview 기능 확인하기

이 실습은 Preview 단계의 기능을 일부 사용합니다. 아래 세 가지 기능이 활성화되어 있는지 차례로 확인합니다. 활성화되어 있지 않다면 워크스페이스 관리자에게 요청합니다.

| Preview 기능 | 사용하는 곳 | 확인 방법 |
|---|---|---|
| Discover Page | Step 3 ~ 5 (Domain, Page) | [2.1) Discover Page](#21-discover-page) |
| Analyze Files in Volumes with Genie Agents | Step 4.5 (Volumes) | [2.2) Analyze Files in Volumes with Genie Agents](#22-analyze-files-in-volumes-with-genie-agents) |
| Genie Ontology snippets | Step 5 (Genie One) | [2.3) Genie Ontology snippets](#23-genie-ontology-snippets) |

!!! info
    **Previews** 페이지는 워크스페이스 관리자만 볼 수 있습니다. 관리자가 아니라면 워크스페이스 관리자에게 아래 세 가지 기능의 활성화 여부를 확인해 달라고 요청합니다. 일부 기능(예: **Discover Page**)은 계정 관리자가 Account Console의 **Previews** 페이지에서 먼저 활성화해야 할 수 있으며, 활성화한 뒤 반영되기까지 몇 분 정도 걸릴 수 있습니다.

### 2.1) Discover Page

1. 우측 상단의 사용자 아이콘을 클릭한 뒤 **Previews**를 클릭합니다.

    ![사용자 메뉴 > Previews](../assets/images/00-introduction/prereq-08-previews-menu.png)

2. 검색창에 `Discover Page`를 입력하고, 토글이 **On**으로 되어 있는지 확인합니다. **Off**라면 클릭해 활성화합니다.

    ![Previews > Discover Page](../assets/images/00-introduction/prereq-09-preview-discover-page.png)

3. 활성화되면 왼쪽 사이드바에 **Discover** 메뉴가 나타납니다.

    ![왼쪽 사이드바의 Discover 메뉴](../assets/images/00-introduction/prereq-12-sidebar-discover.png)

### 2.2) Analyze Files in Volumes with Genie Agents

1. 우측 상단의 사용자 아이콘을 클릭한 뒤 **Previews**를 클릭합니다.

    ![사용자 메뉴 > Previews](../assets/images/00-introduction/prereq-08-previews-menu.png)

2. 검색창에 `Analyze Files in Volumes with Genie Agents`를 입력하고, 토글이 **On**으로 되어 있는지 확인합니다. **Off**라면 클릭해 활성화합니다.

    ![Previews > Analyze Files in Volumes with Genie Agents](../assets/images/00-introduction/prereq-10-preview-genie-volumes.png)

    !!! warning "Lakebase가 필요합니다"
        Genie Agent가 Volume의 문서를 읽으려면 워크스페이스에서 **Lakebase**를 사용할 수 있어야 합니다. 왼쪽 사이드바의 **Compute**에 **Lakebase** 탭이 없다면 Preview를 켜도 4.5를 진행할 수 없습니다. 4.5는 Optional이므로 건너뛰어도 다른 Step에는 영향이 없습니다.

### 2.3) Genie Ontology snippets

1. 우측 상단의 사용자 아이콘을 클릭한 뒤 **Previews**를 클릭합니다.

    ![사용자 메뉴 > Previews](../assets/images/00-introduction/prereq-08-previews-menu.png)

2. 검색창에 `Genie Ontology snippets`를 입력하고, 토글이 **On**으로 되어 있는지 확인합니다. **Off**라면 클릭해 활성화합니다.

    ![Previews > Genie Ontology snippets](../assets/images/00-introduction/prereq-11-preview-ontology-snippets.png)

## 3단계 - 카탈로그 만들기

실습 전체에서 사용할 카탈로그를 만듭니다. 파이프라인 테이블, Metric View, Volume이 모두 이 카탈로그의 `default` 스키마에 만들어집니다.

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤, 상단의 **+** 버튼을 클릭하고 **Create a catalog**를 클릭합니다.

    ![Create a catalog 메뉴](../assets/images/00-introduction/prereq-02-create-catalog-menu.png)

2. **Catalog name**에 `<your_name>_wanderbricks_marketing`을 입력합니다. 예를 들어 이름이 Jiyu라면 `jiyu_wanderbricks_marketing`을 입력합니다. **Type**은 **Standard**를 선택하고, **Storage location**은 기본값을 그대로 둔 채 **Create**를 클릭합니다.

    ![Create a new catalog 다이얼로그](../assets/images/00-introduction/prereq-13-create-catalog-dialog.png)

    !!! tip "이름 규칙"
        `<your_name>`에는 영문 소문자, 숫자, 밑줄(`_`)만 사용합니다. 이 가이드의 SQL과 스크린샷은 모두 `jiyu`를 기준으로 작성되어 있으니, 실습할 때는 본인의 이름으로 바꿔서 입력합니다.

3. **Catalog created!** 창이 나타나면 **View catalog**를 클릭합니다.

    ![Catalog created 메시지](../assets/images/00-introduction/prereq-14-catalog-created.png)

4. 카탈로그 아래에 `default` 스키마가 자동으로 만들어진 것을 확인합니다. 이 실습에서는 별도의 스키마를 만들지 않고 `default` 스키마를 사용합니다.

    ![카탈로그와 default 스키마](../assets/images/00-introduction/prereq-15-catalog-default-schema.png)

## 4단계 - 샘플 데이터 확인하기

이 실습은 모든 워크스페이스에 기본 제공되는 샘플 데이터 `samples.wanderbricks` 중에서 고객(`users`), 예약(`bookings`), 리뷰(`reviews`) 테이블을 사용합니다.

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤, **samples** → **wanderbricks**를 펼칩니다. `users`, `bookings`, `reviews` 테이블이 있는지 확인합니다.

    ![samples.wanderbricks 테이블 목록](../assets/images/00-introduction/prereq-16-samples-wanderbricks.png)

2. 왼쪽 사이드바에서 **SQL Editor**를 클릭합니다.

    ![SQL Editor 메뉴](../assets/images/00-introduction/prereq-17-sql-editor-menu.png)

3. 우측 상단의 compute 아이콘(●)을 클릭한 뒤 **More…**를 클릭합니다. **Attach to an existing compute resource** 창에서 사용할 SQL Warehouse(예: **Serverless Starter Warehouse**)를 선택하고 **Start and attach**를 클릭합니다.

    ![SQL Editor Warehouse 선택](../assets/images/00-introduction/prereq-18-sql-editor-warehouse.png)

4. 아래 쿼리를 붙여넣고 **Run all**을 클릭합니다.

    ```sql
    SELECT 'users' AS table_name, count(*) AS row_count FROM samples.wanderbricks.users
    UNION ALL
    SELECT 'bookings', count(*) FROM samples.wanderbricks.bookings
    UNION ALL
    SELECT 'reviews', count(*) FROM samples.wanderbricks.reviews;
    ```

5. 결과가 아래와 같이 나오는지 확인합니다.

    | table_name | row_count |
    |---|---|
    | users | 124,509 |
    | bookings | 72,247 |
    | reviews | 99,793 |

    ![샘플 데이터 건수 조회 결과](../assets/images/00-introduction/prereq-19-sample-count-result.png)

!!! success "축하합니다!"
    실습 준비를 모두 마쳤습니다. 다음 페이지에서 Wanderbricks와 네 명의 페르소나를 만나 봅니다.
