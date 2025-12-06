
# ajouter une colonne avec un ID pour chaque ligne

Voici la table avec un ID par ligne.[^1][^2]


| ID | Composant | Type | Rôle principal dans l’architecture agentique | Exemples de produits / outils |
| :-- | :-- | :-- | :-- | :-- |
| C01 | Utilisateur (U) | Humain / client | Initie les actions, fournit le contexte via UI ou IDE sécurisé. [^3] | VS Code, JetBrains, portail interne web, appli métier. |
| C02 | API Gateway / APIM (APIM) | Front sécurisé | Point d’entrée unique, TLS, routage, quotas, validation tokens, protection. [^4][^5] | Kong Gateway, Azure API Management, NGINX, Apigee, Tyk, Gravitee, API7. [^1][^6][^7][^8] |
| C03 | IdP / SSO (IDP) | Gestion identité humaine | Authentification, SSO, génération des tokens OIDC/OAuth2 avec rôles et scopes. [^3][^9] | Keycloak, Microsoft Entra ID, Okta, Auth0, PingFederate. |
| C04 | Vault / KMS (VAULT) | Coffre-fort secrets / clés | Stockage chiffré des secrets, clés API, certificats et clés de chiffrement. [^10][^11] | HashiCorp Vault, AWS KMS, Azure Key Vault, GCP KMS, Thales HSM. |
| C05 | Service Mesh (MESH) | Réseau de services | mTLS, identité de workload, observabilité et contrôle réseau fin. [^12][^13] | Istio, Linkerd, Consul Connect, AWS App Mesh, Kuma. |
| C06 | Consentement \& scopes (CONS) | Gestion consentement | Définit les scopes délégués à l’agent (ce qu’il peut faire pour l’utilisateur). [^14][^15] | Flows OAuth2/OIDC dans Keycloak, Entra ID, Okta, écrans de consent intégrés. |
| C07 | Policy Engine (PDP) | Moteur d’autorisation | Décisions “allow/deny” pour actions et accès de l’agent selon règles Zero Trust. [^16][^17] | Open Policy Agent (OPA), Styra DAS, Cedar (AWS), AuthZ custom, Axiomatics. |
| C08 | AI Agent (A) | Orchestrateur d’agents | Porte l’identité applicative, planifie, appelle LLM, outils et données selon policies. [^18][^19] | LangChain / LangGraph, Semantic Kernel, CrewAI, AutoGen, OpenAI Agents. |
| C09 | LLM Runtime (LLM) | Moteur de modèle | Génère texte/plans/outils, local ou via API, sous contrôle des guardrails. [^12][^20] | vLLM, TGI, Ollama, llama.cpp, Azure OpenAI, OpenAI API, Anthropic Claude, Vertex AI. |
| C10 | APIs internes (T1) | Systèmes métier | Outils métiers que l’agent appelle pour lire/écrire (tickets, clients, code). [^16][^17] | ServiceNow, Jira DC, SAP, Salesforce, GitHub/GitLab API, outils internes REST/GraphQL. |
| C11 | APIs externes / SaaS (T2) | Services tiers | Capacités externes accessibles par l’agent avec clés/scopes dédiés. [^4][^20] | Jira Cloud, ServiceNow SaaS, Slack, Notion, Google Workspace, LLM APIs managées. |
| C12 | Vector DB / Data Store (DATA) | Stockage données IA | Stocke embeddings, documents, données interrogées via filtrage par droits. [^11][^2][^21] | Pinecone, Qdrant, Weaviate, Milvus, pgvector, Chroma, Redis, OpenSearch, Elasticsearch. |
| C13 | Monitoring / SIEM (MON) | Observabilité \& audit | Centralise logs, traces, métriques pour audit et détection d’anomalies. [^12][^13] | Prometheus, Grafana, Loki, OpenTelemetry, Splunk, Elastic/ELK, Datadog, New Relic. |
| C14 | Guardrails IA (IAS) | Sécurité IA spécifique | Filtre prompts/réponses, détecte fuites de données et contenus risqués. [^22][^23][^24][^25] | Guardrails AI, Patronus AI, Protect AI, AI Gateway Cloudflare, modèles de modération/PII sur Hugging Face. |

<div align="center">⁂</div>

[^1]: https://nordicapis.com/top-10-api-gateways-in-2025/

[^2]: https://liveblocks.io/blog/whats-the-best-vector-database-for-building-ai-products

[^3]: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/infrastructure/security

[^4]: https://cloudsecurityalliance.org/blog/2025/09/09/api-security-in-the-ai-era

[^5]: https://learn.microsoft.com/en-us/azure/architecture/microservices/design/gateway

[^6]: https://zuplo.com/learning-center/top-api-gateway-solutions

[^7]: https://api7.ai/fr/blog/api-gateway-use-cases

[^8]: https://www.talend.com/fr/resources/api-gateway/

[^9]: https://www.pingidentity.com/en/resources/identity-fundamentals/agentic-ai/iam-best-practices-ai-agents.html

[^10]: https://aembit.io/blog/how-to-secure-non-human-identities-for-ai-workloads/

[^11]: https://dacodes.com/blog/safeguarding-sensitive-data-in-ai-pipelines

[^12]: https://www.sysdig.com/learn-cloud-native/top-8-ai-security-best-practices

[^13]: https://www.dsstream.com/post/security-for-mlops-how-to-safeguard-data-models-and-pipelines-against-modern-ai-threats

[^14]: https://curity.io/blog/user-consent-best-practices-in-the-age-of-ai-agents/

[^15]: https://auth0.com/blog/access-control-in-the-era-of-ai-agents/

[^16]: https://www.getmonetizely.com/articles/zero-trust-architecture-for-agentic-ai-how-can-we-design-security-first-systems

[^17]: https://security.googlecloudcommunity.com/ciso-blog-77/10-tips-for-governing-ai-agents-6081

[^18]: https://www.emergentmind.com/topics/llm-based-multi-agent-systems-llm-mas

[^19]: https://developer.microsoft.com/blog/designing-multi-agent-intelligence

[^20]: https://www.wiz.io/academy/ai-agent-security

[^21]: https://www.datacamp.com/blog/the-top-5-vector-databases

[^22]: https://www.mckinsey.com/featured-insights/mckinsey-explainers/what-are-ai-guardrails

[^23]: https://www.guardrailsai.com

[^24]: https://www.patronus.ai/ai-reliability/ai-guardrails

[^25]: https://www.datacamp.com/blog/llm-guardrails

