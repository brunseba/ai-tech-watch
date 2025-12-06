
# Agentic AI Components Model (C01-C14)

Here is the updated Mermaid diagram with component IDs (C01…C14) in the labels.[^1][^2]

```mermaid
flowchart LR
    classDef user fill:#e3f2fd,stroke:#1e88e5,color:#0d47a1;
    classDef agent fill:#fff3e0,stroke:#fb8c00,color:#e65100;
    classDef tool fill:#e8f5e9,stroke:#43a047,color:#1b5e20;
    classDef sec fill:#ffebee,stroke:#e53935,color:#b71c1c;
    classDef infra fill:#ede7f6,stroke:#5e35b1,color:#311b92;

    %% User and front
    C01[ C01 - User<br/>Portal or IDE ]:::user
    C02[ C02 - API Gateway or APIM<br/>Kong, APIM, Envoy ]:::infra
    C03[ C03 - IdP or SSO<br/>Keycloak, Entra ID, Okta ]:::infra

    %% Identity / secrets / mesh management
    C04[ C04 - Vault or KMS<br/>Vault, KMS, HSM ]:::sec
    C05[ C05 - Service Mesh mTLS<br/>Istio, Linkerd ]:::infra

    %% Consent / policies
    C06[ C06 - Consent and scopes<br/>OAuth2 and OIDC ]:::sec
    C07[ C07 - Policy Engine<br/>OPA, Cedar, ABAC ]:::sec

    %% Agent and AI runtime
    C08[ C08 - AI Agent<br/>Agent orchestrator ]:::agent
    C09[ C09 - LLM Runtime<br/>Ollama, vLLM, TGI ]:::agent

    %% Tools / systems
    C10[ C10 - Internal APIs<br/>CRM, ERP, ITSM, Git ]:::tool
    C11[ C11 - External APIs and SaaS<br/>Jira, ServiceNow, LLM APIs ]:::tool
    C12[ C12 - Vector DB and Data Store<br/>PgVector, Milvus, S3, DWH ]:::tool

    %% Monitoring / AI security
    C13[ C13 - Monitoring and SIEM<br/>Prometheus, Loki, SIEM ]:::sec
    C14[ C14 - AI Guardrails<br/>Prompt and response filtering ]:::sec

    %% User flow
    C01 -->|HTTPS| C02
    C02 -->|OIDC redirect| C03
    C03 -->|ID token and access token| C02
    C02 -->|User context and scopes| C06
    C06 -->|Scope delegated to agent| C08

    %% Identities and secrets
    C08 -->|Application secrets| C04
    C09 -->|Model keys| C04
    C04 --- C05

    %% Policies and Zero Trust
    C08 -->|Action request with context| C07
    C07 -->|Allow or deny decision| C08
    C08 -->|mTLS calls| C05

    %% AI runtime
    C08 -->|Prompts and plans| C09
    C09 -->|Responses and tools| C08

    %% Internal / external tools
    C08 -->|Internal API call| C10
    C08 -->|External API call| C11
    C08 -->|Filtered data query| C12

    %% Observability / guardrails
    C08 -->|Agent and tool traces| C13
    C09 -->|Model logs| C13
    C10 -->|Internal API logs| C13
    C11 -->|External API logs| C13
    C12 -->|Data access logs| C13

    C02 -->|Access and quota logs| C13
    C07 -->|Policy decision logs| C13

    C08 -->|Prompt and response control| C14
    C09 -->|Sensitive content control| C14
```

The IDs C01–C14 correspond to the rows in the previous table, which facilitates navigation between architecture docs, diagrams, and detailed specifications.[^3][^1]

<div align="center">⁂</div>

[^1]: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/infrastructure/security

[^2]: https://nordicapis.com/top-10-api-gateways-in-2025/

[^3]: https://liveblocks.io/blog/whats-the-best-vector-database-for-building-ai-products

