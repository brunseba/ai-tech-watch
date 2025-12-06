<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# met a jour le schema mermaod avec les ID des composants

Voici le schéma Mermaid mis à jour avec les IDs des composants (C01…C14) dans les labels.[^1][^2]

```mermaid
flowchart LR
    classDef user fill:#e3f2fd,stroke:#1e88e5,color:#0d47a1;
    classDef agent fill:#fff3e0,stroke:#fb8c00,color:#e65100;
    classDef tool fill:#e8f5e9,stroke:#43a047,color:#1b5e20;
    classDef sec fill:#ffebee,stroke:#e53935,color:#b71c1c;
    classDef infra fill:#ede7f6,stroke:#5e35b1,color:#311b92;

    %% Utilisateur et front
    C01[ C01 - Utilisateur<br/>Portail ou IDE ]:::user
    C02[ C02 - API Gateway ou APIM<br/>Kong, APIM, Envoy ]:::infra
    C03[ C03 - IdP ou SSO<br/>Keycloak, Entra ID, Okta ]:::infra

    %% Gestion identites / secrets / mesh
    C04[ C04 - Vault ou KMS<br/>Vault, KMS, HSM ]:::sec
    C05[ C05 - Service Mesh mTLS<br/>Istio, Linkerd ]:::infra

    %% Consentement / politiques
    C06[ C06 - Consentement et scopes<br/>OAuth2 et OIDC ]:::sec
    C07[ C07 - Policy Engine<br/>OPA, Cedar, ABAC ]:::sec

    %% Agent et runtime IA
    C08[ C08 - AI Agent<br/>Orchestrateur agents ]:::agent
    C09[ C09 - LLM Runtime<br/>Ollama, vLLM, TGI ]:::agent

    %% Outils / systemes
    C10[ C10 - APIs internes<br/>CRM, ERP, ITSM, Git ]:::tool
    C11[ C11 - APIs externes et SaaS<br/>Jira, ServiceNow, LLM APIs ]:::tool
    C12[ C12 - Vector DB et Data Store<br/>PgVector, Milvus, S3, DWH ]:::tool

    %% Monitoring / securite IA
    C13[ C13 - Monitoring et SIEM<br/>Prometheus, Loki, SIEM ]:::sec
    C14[ C14 - Guardrails IA<br/>Filtrage prompts et reponses ]:::sec

    %% Flux utilisateur
    C01 -->|HTTPS| C02
    C02 -->|OIDC redirect| C03
    C03 -->|ID token et access token| C02
    C02 -->|Contexte utilisateur et scopes| C06
    C06 -->|Scope delegue a l agent| C08

    %% Identites et secrets
    C08 -->|Secrets applicatifs| C04
    C09 -->|Cles modeles| C04
    C04 --- C05

    %% Policies et Zero Trust
    C08 -->|Demande action avec contexte| C07
    C07 -->|Decision allow ou deny| C08
    C08 -->|Appels mTLS| C05

    %% IA runtime
    C08 -->|Prompts et plans| C09
    C09 -->|Reponses et outils| C08

    %% Outils internes / externes
    C08 -->|Appel API interne| C10
    C08 -->|Appel API externe| C11
    C08 -->|Requete filtree sur donnees| C12

    %% Observabilite / guardrails
    C08 -->|Traces agent et outils| C13
    C09 -->|Logs modeles| C13
    C10 -->|Logs API internes| C13
    C11 -->|Logs API externes| C13
    C12 -->|Logs acces donnees| C13

    C02 -->|Logs acces et quotas| C13
    C07 -->|Logs decisions policy| C13

    C08 -->|Controle prompts et reponses| C14
    C09 -->|Controle contenu sensible| C14
```

Les IDs C01–C14 correspondent aux lignes de la table précédente, ce qui facilite la navigation entre doc d’archi, diagrammes et spécifications détaillées.[^3][^1]

<div align="center">⁂</div>

[^1]: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/infrastructure/security

[^2]: https://nordicapis.com/top-10-api-gateways-in-2025/

[^3]: https://liveblocks.io/blog/whats-the-best-vector-database-for-building-ai-products

