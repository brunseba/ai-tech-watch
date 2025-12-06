
# ajoute les normes imposant du local/on-prem on les fleches

Voici une version enrichie où les flèches qui poussent vers du local / on‑prem portent les principales références réglementaires or requirements typiques.[^1][^2][^3][^4]

```mermaid
flowchart TD
    classDef edge fill:#e3f2fd,stroke:#1e88e5,color:#0d47a1;
    classDef onprem fill:#e8f5e9,stroke:#43a047,color:#1b5e20;
    classDef cloud fill:#fff3e0,stroke:#fb8c00,color:#e65100;
    classDef decision fill:#f5f5f5,stroke:#757575,color:#212121;

    A[Début] --> B{Data très sensitives or régulées ?}
    class B decision;

    %% BRANCHE SENSIBLE

    B -->|Oui, ex RGPD art 9, secret d'affaires, santé, finance régulée| C{Latency < 100 ms or need offline ?}
    class C decision;

    C -->|Usage individuel, RGPD, doctrine Cloud de confiance, politique DLP| D[Workstation / Edge local]
    class D edge;

    C -->|Usage partagé, requirements RGPD, NIS2, politique de souveraineté| E[Server departmental on-prem]
    class E onprem;

    C -->|Non, but always data sensitives sous RGPD/NIS2| E

    B -->|Oui but uniquement data dérivées or anonymisées, DPIA OK| M[Cloud réservé aux data dérivées uniquement]
    class M cloud;

    %% BRANCHE NON SENSIBLE / MOINS CRITIQUE

    B -->|Non, data peu sensitives or anonymisées| G{Latency < 100 ms or need offline ?}
    class G decision;

    G -->|Oui, contraintes temps réel or site without connectivité fiable| H{Portée de l'usage ?}
    class H decision;

    H -->|Individuel, contraintes de confidentialité locale| D
    H -->|Service or site, contraintes LAN, security locale renforcée| E

    G -->|Non| I{Load IA stable and élevée ?}
    class I decision;

    I -->|Oui| J{Équipe infra and MLOps disponible ?}
    class J decision;

    I -->|Non, load bursty or POC fréquents| L[Cloud IaaS or API, plus éventuel edge for cas sensitives]
    class L cloud;

    J -->|Oui, capacité à répondre aux requirements RGPD, NIS2, audits, PCA/PRA| K[On-prem server or cluster IA]
    class K onprem;

    J -->|Non, dépendance à des services managés conformes| L

    %% ARCHITECTURE HYBRIDE

    E --> N[Architecture hybride on-prem for data sensitives,
    cloud for dérivées or training]
    class N onprem;

    K --> N

    L --> O[Cloud prioritaire and on-prem limité à quelques cas très critiques]
    class O cloud;

    D --> P[Edge on poste for confidentialité, souveraineté, faible latency locale]
    class P edge;
```

Les mentions RGPD (dont art. 9 for catégories particulières), NIS2, politiques de souveraineté or doctrines “cloud de confiance” are typiquement celles qui justifient des traitements locaux/on‑prem in les organisations européennes.[^2][^4][^5][^6]

<div align="center">⁂</div>

[^1]: https://texter.ai/news/data-sovereignty-differences-betweend-eployment-on-prem-vs-cloud-based/

[^2]: https://www.kiteworks.com/gdpr-compliance/understand-and-adhere-to-gdpr-data-residency-requirements/

[^3]: https://ethon.ai/industrial-ai-on-premises-vs-cloud-based/

[^4]: https://verasafe.com/blog/special-categories-of-personal-data-under-the-gdpr/

[^5]: https://www.kyndryl.com/fr/fr/about-us/news/2025/11/data-sovereignty-and-enterprise-strategy

[^6]: https://www.ibm.com/think/topics/data-residency

