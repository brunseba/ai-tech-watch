<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# exemple d'integration sous forme de schema

Un exemple classique : intégrer un agent pour traiter automatiquement une partie d’un workflow ITSM (tickets d’incident) en s’appuyant sur tes systèmes existants.[^1][^2]

## Schéma Mermaid d’intégration dans un workflow ITSM

```mermaid
flowchart LR
    classDef user fill:#e3f2fd,stroke:#1e88e5,color:#0d47a1;
    classDef agent fill:#fff3e0,stroke:#fb8c00,color:#e65100;
    classDef tool fill:#e8f5e9,stroke:#43a047,color:#1b5e20;
    classDef infra fill:#ede7f6,stroke:#5e35b1,color:#311b92;
    classDef sec fill:#ffebee,stroke:#e53935,color:#b71c1c;

    U[Utilisateur<br/>Portail ITSM]:::user
    ITSM[Outil ITSM<br/>ServiceNow ou Jira Service Management]:::tool
    ORCH[Orchestrateur workflow<br/>BPMN, n8n, Temporal, Argo]:::infra
    APIM[API Gateway / APIM]:::infra
    AGENT[AI Agent ITSM<br/>classification, enrichissement, actions]:::agent
    LLM[LLM Runtime<br/>local ou cloud]:::agent
    CMDB[CMDB / Observabilite<br/>logs, metrics]:::tool
    APPROVE[Validation humaine<br/>Ops / Support]:::user
    SEC[Policy / Guardrails<br/>scope, filtres, audit]:::sec

    U -->|Cree un ticket| ITSM
    ITSM -->|Trigger integration<br/>webhook ou event| ORCH

    ORCH -->|Appel REST ticket brut| APIM
    APIM -->|Requete securisee| AGENT

    AGENT -->|Consultation contexte<br/>CMDB, logs| CMDB
    AGENT -->|Appel LLM pour analyse<br/>resume, categorie, priorite| LLM
    LLM -->|Proposition classification et reponse| AGENT

    AGENT -->|Proposition mise a jour ticket<br/>commentaire, champs| ORCH
    ORCH -->|Met a jour ticket| ITSM

    ORCH -->|Si changement impactant<br/>modif config, close ticket| APPROVE
    APPROVE -->|Validation ou rejet| ORCH

    AGENT -->|Toutes actions journalisees| SEC
    ORCH -->|Logs workflow| SEC
    APIM -->|Logs API| SEC
```

Dans cet exemple :

- Le workflow principal reste porté par l’outil ITSM et l’orchestrateur, l’agent n’est qu’un step d’analyse et de proposition d’actions.[^3][^1]
- Les validations sensibles passent toujours par une étape humaine, l’agent fournit le contexte et les suggestions.[^4][^5]

Le même pattern se transpose bien à d’autres workflows (onboarding client, SOC, CI/CD) en remplaçant ITSM et CMDB par tes systèmes métier.

<div align="center">⁂</div>

[^1]: https://mitrix.io/blog/how-to-integrate-ai-agents-with-your-existing-tech-stack/

[^2]: https://www.talktoagent.com/blog/integrate-ai-agents-existing-systems

[^3]: https://botscrew.com/blog/how-to-integrate-ai-agents-with-enterprise-systems/

[^4]: https://www.zenesys.com/ai-agent-integration-explained-how-to-build-smarter-faster-workflows

[^5]: https://www.cybersec-automation.com/p/integrating-ai-agents-into-existing-soc-workflows-best-practices-61391cdca6acf83b

