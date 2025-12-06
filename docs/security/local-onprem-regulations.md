
# ajoute les normes imposant du local/on-prem sur les fleches

Voici une version enrichie où les flèches qui poussent vers du local / on‑prem portent les principales références réglementaires ou exigences typiques.[^1][^2][^3][^4]

```mermaid
flowchart TD
    classDef edge fill:#e3f2fd,stroke:#1e88e5,color:#0d47a1;
    classDef onprem fill:#e8f5e9,stroke:#43a047,color:#1b5e20;
    classDef cloud fill:#fff3e0,stroke:#fb8c00,color:#e65100;
    classDef decision fill:#f5f5f5,stroke:#757575,color:#212121;

    A[Début] --> B{Data très sensibles ou régulées ?}
    class B decision;

    %% BRANCHE SENSIBLE

    B -->|Oui, ex RGPD art 9, secret d'affaires, santé, finance régulée| C{Latence < 100 ms ou besoin offline ?}
    class C decision;

    C -->|Usage individuel, RGPD, doctrine Cloud de confiance, politique DLP| D[Poste de travail / Edge local]
    class D edge;

    C -->|Usage partagé, exigences RGPD, NIS2, politique de souveraineté| E[Serveur départemental on-prem]
    class E onprem;

    C -->|Non, mais toujours data sensibles sous RGPD/NIS2| E

    B -->|Oui mais uniquement data dérivées ou anonymisées, DPIA OK| M[Cloud réservé aux data dérivées uniquement]
    class M cloud;

    %% BRANCHE NON SENSIBLE / MOINS CRITIQUE

    B -->|Non, data peu sensibles ou anonymisées| G{Latence < 100 ms ou besoin offline ?}
    class G decision;

    G -->|Oui, contraintes temps réel ou site sans connectivité fiable| H{Portée de l'usage ?}
    class H decision;

    H -->|Individuel, contraintes de confidentialité locale| D
    H -->|Service ou site, contraintes LAN, security locale renforcée| E

    G -->|Non| I{Charge IA stable et élevée ?}
    class I decision;

    I -->|Oui| J{Équipe infra et MLOps disponible ?}
    class J decision;

    I -->|Non, charge bursty ou POC fréquents| L[Cloud IaaS ou API, plus éventuel edge pour cas sensibles]
    class L cloud;

    J -->|Oui, capacité à répondre aux exigences RGPD, NIS2, audits, PCA/PRA| K[On-prem serveur ou cluster IA]
    class K onprem;

    J -->|Non, dépendance à des services managés conformes| L

    %% ARCHITECTURE HYBRIDE

    E --> N[Architecture hybride on-prem pour data sensibles,
    cloud pour dérivées ou entraînement]
    class N onprem;

    K --> N

    L --> O[Cloud prioritaire et on-prem limité à quelques cas très critiques]
    class O cloud;

    D --> P[Edge sur poste pour confidentialité, souveraineté, faible latence locale]
    class P edge;
```

Les mentions RGPD (dont art. 9 pour catégories particulières), NIS2, politiques de souveraineté ou doctrines “cloud de confiance” sont typiquement celles qui justifient des traitements locaux/on‑prem dans les organisations européennes.[^2][^4][^5][^6]

<div align="center">⁂</div>

[^1]: https://texter.ai/news/data-sovereignty-differences-betweend-eployment-on-prem-vs-cloud-based/

[^2]: https://www.kiteworks.com/gdpr-compliance/understand-and-adhere-to-gdpr-data-residency-requirements/

[^3]: https://ethon.ai/industrial-ai-on-premises-vs-cloud-based/

[^4]: https://verasafe.com/blog/special-categories-of-personal-data-under-the-gdpr/

[^5]: https://www.kyndryl.com/fr/fr/about-us/news/2025/11/data-sovereignty-and-enterprise-strategy

[^6]: https://www.ibm.com/think/topics/data-residency

