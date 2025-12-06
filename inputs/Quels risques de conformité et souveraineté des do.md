<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Quels risques de conformité et souveraineté des données pour chaque modèle

Les risques de conformité et de souveraineté augmentent globalement quand on va du poste de travail vers le cloud public, surtout pour des données personnelles/sectorielles (santé, finance, secteur public).[^1][^2]

## Poste de travail (edge individuel)

- Souveraineté : le poste permet de garder les données dans le pays / l’organisation, ce qui simplifie la conformité aux exigences de résidence (ex. garder les données dans l’UE pour le RGPD), à condition de maîtriser sauvegardes et synchronisations.[^3][^4]
- Risques : fuite de données par synchronisation grand public (cloud perso, outils non approuvés), vol/perte de poste mal chiffré, absence de journaux centralisés limitant la capacité de preuve en cas d’audit.[^5][^6]


## Serveurs départementaux / on‑prem

- Souveraineté : contrôle maximal sur la localisation et la juridiction des données, ce qui permet de démontrer plus facilement la résidence et la souveraineté (données hébergées dans un DC interne ou un prestataire local sous droit national).[^7][^8][^1]
- Risques :
    - Non‑conformité si les flux sortants (sauvegardes, support, télémétrie) ne sont pas cartographiés et contractualisés (sous‑traitants, clauses, RoPA).[^2][^3]
    - Sécurité parfois sous‑dimensionnée (patching, SOC 24/7, gestion des accès), ce qui peut créer des incidents de sécurité tout aussi problématiques que dans le cloud.[^9][^5]


## Cloud public (SaaS / PaaS / IaaS)

- Souveraineté :
    - Exposition à la juridiction du pays du fournisseur ou de certains points d’accès (lois extraterritoriales, demandes d’accès gouvernementales).[^10][^11][^2]
    - Complexité accrue pour prouver la résidence et les flux de données, notamment en cas de réplication inter‑régions, cache edge/CDN ou support technique offshore.[^12][^3][^10]
- Conformité :
    - Forte dépendance aux engagements contractuels du fournisseur (DPA, clauses contractuelles types, localisation des DC, certifications) et à la bonne configuration client (IAM, régions, logs).[^8][^13][^7]
    - Risque de transfert illégal ou mal documenté de données hors de l’EEE au regard du RGPD, surtout si les évaluations d’impact (TIA, RoPA) sont incomplètes.[^14][^2][^3]


## Edge / cloud hybride

- Avantages : possibilité de garder les données sensibles in‑situ (poste ou on‑prem) et d’envoyer au cloud seulement des données pseudonymisées, agrégées ou des métadonnées, ce qui réduit fortement le risque de non‑conformité.[^15][^13][^8]
- Risques :
    - Architecture mal segmentée où des workloads cloud voient malgré tout des données identifiables (mauvais masquage, dérives de configuration).[^6][^10]
    - Multiplication des sous‑traitants et des régimes juridiques (cloud, sauvegarde, monitoring, CDNs), ce qui complique la gouvernance et la tenue des registres de traitement.[^15][^14]


## Tableau synthétique des risques

| Modèle de déploiement | Risques principaux de conformité / souveraineté |
| :-- | :-- |
| Poste de travail | Perte/vol de poste, sync non maîtrisées, faible traçabilité. [^5][^4] |
| Serveur on‑prem / département | Patching/sécurité internes, flux sortants mal documentés, charge de preuve sur l’organisation. [^1][^7] |
| Cloud public | Transferts transfrontaliers, lois extraterritoriales, dépendance contractuelle, mauvaise configuration client. [^2][^10][^6] |
| Architecture hybride | Complexité de gouvernance multi‑fournisseurs, risques de “leak” de données sensibles vers le cloud si la segmentation est mal faite. [^15][^8] |

Si tu veux, tu peux détailler ton secteur (ex. santé, banque, collectivité), pour mapper ces risques à des textes précis (RGPD, NIS2, doctrines cloud, exigences nationales de localisation, etc.) et ajuster les patterns d’architecture et de contrats à viser.
<span style="display:none">[^16][^17][^18][^19][^20]</span>

<div align="center">⁂</div>

[^1]: https://texter.ai/news/data-sovereignty-differences-betweend-eployment-on-prem-vs-cloud-based/

[^2]: https://cloudian.com/guides/data-protection/data-sovereignty-in-the-cloud-key-considerations/

[^3]: https://www.kiteworks.com/gdpr-compliance/understand-and-adhere-to-gdpr-data-residency-requirements/

[^4]: https://vexxhost.com/blog/staying-gdpr-compliant-with-edge-computing/

[^5]: https://facit.ai/insights/cloud-based-vs-on-premises-security-and-compliance

[^6]: https://www.opswat.com/blog/cloud-vs-on-premise-security

[^7]: https://datanorth.ai/blog/on-premise-vs-cloud-in-ai

[^8]: https://ethon.ai/industrial-ai-on-premises-vs-cloud-based/

[^9]: https://aiello.ai/blog/cloud-based-ai-vs-on-premise-ai-which-is-better

[^10]: https://destcert.com/resources/data-sovereignty-vs-data-residency/

[^11]: https://novoserve.com/blog/do-you-own-your-data-sovereignty-the-battle-between-public-cloud-private-cloud-and-hybrid-cloud

[^12]: https://cpl.thalesgroup.com/faq/data-security-in-the-cloud/how-do-i-enforce-data-residency-policies-in-the-cloud-and-specifically-comply-with-gdpr

[^13]: https://learn.microsoft.com/en-us/windows/ai/cloud-ai

[^14]: https://www.ibm.com/think/topics/data-residency

[^15]: https://www.kyndryl.com/fr/fr/about-us/news/2025/11/data-sovereignty-and-enterprise-strategy

[^16]: https://www.easyredmine.com/blog/defense-data-security

[^17]: https://www.sentinelone.com/cybersecurity-101/cloud-security/cloud-vs-on-premise-security/

[^18]: https://www.cybereason.com/blog/on-premise-vs-cloud-based-edr

[^19]: https://www.compuser.ai/blogs?p=private-cloud-workspace-vs-public-cloud-compliance

[^20]: https://exeon.com/blog/on-premises-vs-cloud-security/

