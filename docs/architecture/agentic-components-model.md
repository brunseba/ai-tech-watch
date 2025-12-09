
# Agentic AI Components Model (C01-C14)

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

| ID | Composant | Type | Rôle principal in l’architecture agentique | Examples de produits / outils |
| :-- | :-- | :-- | :-- | :-- |
| C01 | Utilisateur (U) | Humain / client | Initie les actions, fournit le contexte via UI or IDE sécurisé.  | VS Code, JetBrains, portail internal web, appli métier. |
| C02 | API Gateway / APIM (APIM) | Front sécurisé | Point d’entrée unique, TLS, routage, quotas, validation tokens, protection. | Kong Gateway, Azure API Management, NGINX, Apigee, Tyk, Gravitee, API7. |
| C03 | IdP / SSO (IDP) | Gestion identité humaine | Authentication, SSO, génération des tokens OIDC/OAuth2 with rôles and scopes.  | Keycloak, Microsoft Entra ID, Okta, Auth0, PingFederate. |
| C04 | Vault / KMS (VAULT) | Coffre-fort secrets / clés | Storage chiffré des secrets, clés API, certificats and clés de encryption.  | HashiCorp Vault, AWS KMS, Azure Key Vault, GCP KMS, Thales HSM. |
| C05 | Service Mesh (MESH) | Network de services | mTLS, identité de workload, observabilité and control network fin.  | Istio, Linkerd, Consul Connect, AWS App Mesh, Kuma. |
| C06 | Consentement \& scopes (CONS) | Gestion consentement | Définit les scopes délégués à l’agent (ce qu’il can faire for l’utilisateur).  | Flows OAuth2/OIDC in Keycloak, Entra ID, Okta, écrans de consent intégrés. |
| C07 | Policy Engine (PDP) | Moteur d’authorization | Décisions “allow/deny” for actions and accès de l’agent according to rules Zero Trust. | Open Policy Agent (OPA), Styra DAS, Cedar (AWS), AuthZ custom, Axiomatics. |
| C08 | AI Agent (A) | Orchestrateur d’agents | Porte l’identité applicative, planifie, appelle LLM, outils and data according to policies.  | LangChain / LangGraph, Semantic Kernel, CrewAI, AutoGen, OpenAI Agents. |
| C09 | LLM Runtime (LLM) | Moteur de modèle | Génère texte/plans/outils, local or via API, sous control des guardrails.  | vLLM, TGI, Ollama, llama.cpp, Azure OpenAI, OpenAI API, Anthropic Claude, Vertex AI. |
| C10 | APIs internals (T1) | Systèmes métier | Outils métiers que l’agent appelle for lire/écrire (tickets, clients, code). | ServiceNow, Jira DC, SAP, Salesforce, GitHub/GitLab API, outils internals REST/GraphQL. |
| C11 | APIs externals / SaaS (T2) | Services tiers | Capacités externals accessibles par l’agent with clés/scopes dédiés.  | Jira Cloud, ServiceNow SaaS, Slack, Notion, Google Workspace, LLM APIs managées. |
| C12 | Vector DB / Data Store (DATA) | Storage data IA | Stocke embeddings, documents, data interrogées via filtrage par droits.  | Pinecone, Qdrant, Weaviate, Milvus, pgvector, Chroma, Redis, OpenSearch, Elasticsearch. |
| C13 | Monitoring / SIEM (MON) | Observabilité \& audit | Centralise logs, traces, métriques for audit and détection d’anomalies.  | Prometheus, Grafana, Loki, OpenTelemetry, Splunk, Elastic/ELK, Datadog, New Relic. |
| C14 | Guardrails IA (IAS) | Security IA spécifique | Filtre prompts/réponses, détecte fuites de data and contenus risqués.  | Guardrails AI, Patronus AI, Protect AI, AI Gateway Cloudflare, models de modération/PII on Hugging Face. |



