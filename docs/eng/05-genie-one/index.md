# 5) Ask with Genie One

<div class="wb-meta" markdown>

- :material-clock-outline: About 15 min
- :material-account-outline: Mina

</div>

## Lab overview

The Pages you created in Step 4 are referenced by **Genie One**, not by Genie Agent. In this lab, you'll ask questions with business terms in Genie One and verify that Genie One answers with the Pages you created as sources.

## Your role in this lab

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Mina](../assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

*"Now I want to ask my questions directly without asking the data team for help."*

You're marketing executive Mina. Instead of finding a specific Genie Agent, you ask questions directly in Genie One.

</div>

</div>

## How are Genie Agent and Genie One different?

| | Genie Agent | Genie One |
|---|---|---|
| Scope | Specialized agent configured for specific data | Entire workspace data and business definitions |
| References | Connected Metric Views and tables, Instructions | Metric Views, Domain, **Pages**, Genie Agents, etc. |
| Best for | Repeated analysis within a defined business area | Questions where you're unsure what data to look at, term definitions |

Genie One answers based on **Genie Ontology**. Genie Ontology combines Unity Catalog Semantics you defined directly (Metric Views, Domains, Pages) with context automatically extracted from dashboards and queries. When a term is defined with a Page, Genie One prioritizes the Page definition over auto-inferred context.

## Task 1 - Open Genie One

1. Click the app switcher icon (**Switch apps**) in the top right, then click **Genie One**.

    ![Open Genie One](../assets/images/05-genie-one/5-01-open-genie-one.png)

2. When the Genie One screen (**How can I help you?**) opens, check the input box.

    ![Genie One screen](../assets/images/05-genie-one/5-02-genie-one-home.png)

## Task 2 - Ask about term definitions

1. Enter and send the question below.

    !!! prompt "Prompt"
        ```text
        How do revenue and net revenue differ at Wanderbricks? How much of each was there in 2024?
        ```

    ![Enter question](../assets/images/05-genie-one/5-03-ask-revenue-definition.png)

2. Verify Genie One explains the difference between revenue (confirmed/completed basis) and net revenue (completed basis) and gives 2024 amounts.

    ![Revenue and net revenue answer](../assets/images/05-genie-one/5-04-revenue-answer.png)

3. Click **Genie Ontology** (2) at the bottom of the answer to verify the sources are the **Revenue** and **Net Revenue** Pages you created in Step 4. The Page icon next to the definitions in the answer text also points to the same sources.

    ![Page citation](../assets/images/05-genie-one/5-05-page-citation.png)

## Task 3 - Open the source Page

1. In the **Genie Ontology** menu, click **Revenue**.

    ![Click citation](../assets/images/05-genie-one/5-06-click-citation.png)

2. Verify the right panel shows the `Revenue` Page you created in Step 4, displaying Domain, Synonyms, and Definition.

    ![Revenue Page](../assets/images/05-genie-one/5-07-page-opened.png)

## Task 4 - Ask about peak season

1. Click **New chat** in the top left to start a new conversation and enter the question below.

    !!! prompt "Prompt"
        ```text
        When is peak season at Wanderbricks? And how many peak-season bookings were there in 2024?
        ```

2. Verify Genie One explains peak season as check-in months 6, 7, 8, and 12, and answers 2024 peak-season bookings as **8,001**. Click **Genie Ontology** (1) below the answer to see **Peak Season** Page as the source.

    ![Peak season answer](../assets/images/05-genie-one/5-08-peak-season-answer.png)

!!! tip "Number-only questions might route to Genie Agent"
    Questions like "Show me top 5 countries by revenue in 2024" that ask only for numbers might be routed by Genie One to the Genie Agent you created in Step 4, which shows the Genie Agent link as source instead of Pages. Including a definition request together makes it easier to see Pages as sources.

!!! info "Multiple Pages in shared workspace"
    If you practice in a shared workspace, other practitioners' Wanderbricks-related Pages might appear as sources. Verify the Pages belong to your Domain (`<your_name>_wanderbricks_marketing`).

!!! success "Congratulations!"
    You've completed Mina's work. You got answers to business questions directly without asking the data team, using term definitions and metrics governed by agreements and standardized by your organization.
