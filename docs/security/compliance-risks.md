
# Which risques de conformité and souveraineté des data for chaque modèle

Les risques de conformité and de souveraineté augmentent globalement quand on va du workstation vers le cloud public, surtout for des data personnelles/sectorielles (santé, finance, secteur public).[^1][^2]

## Workstation (edge individuel)

- Souveraineté : le poste permet de garder les data in le pays / l’organisation, ce qui simplifie la conformité aux requirements de résidence (ex. garder les data in l’UE for le RGPD), à condition de maîtriser sauvegardes and synchronisations.[^3][^4]
- Risques : fuite de data par synchronisation grand public (cloud perso, outils non approuvés), vol/perte de poste mal chiffré, absence de journaux centralisés limitant la capacité de preuve en cas d’audit.[^5][^6]


## Servers départementaux / on‑prem

- Souveraineté : control maximal on la localisation and la juridiction des data, ce qui permet de démontrer plus facilement la résidence and la souveraineté (data hébergées in un DC internal or un prestataire local sous droit national).[^7][^8][^1]
- Risques :
    - Non‑conformité if les flow sortants (sauvegardes, support, télémétrie) ne are pas cartographiés and contractualisés (sous‑traitants, clauses, RoPA).[^2][^3]
    - Security sometimes sous‑dimensionnée (patching, SOC 24/7, gestion des accès), ce qui can créer des incidents de security tout aussi problématiques que in le cloud.[^9][^5]


## Cloud public (SaaS / PaaS / IaaS)

- Souveraineté :
    - Exposition à la juridiction du pays du fournisseur or de certains points d’accès (lois extraterritoriales, demandes d’accès gouvernementales).[^10][^11][^2]
    - Complexité accrue for prouver la résidence and les flow de data, notamment en cas de réplication inter‑régions, cache edge/CDN or support technique offshore.[^12][^3][^10]
- Conformité :
    - Forte dépendance aux engagements contractuels du fournisseur (DPA, clauses contractuelles types, localisation des DC, certifications) and à la bonne configuration client (IAM, régions, logs).[^8][^13][^7]
    - Risque de transfert illégal or mal documenté de data hors de l’EEE au regard du RGPD, surtout if les évaluations d’impact (TIA, RoPA) are incomplètes.[^14][^2][^3]


## Edge / cloud hybride

- Advantages : possibilité de garder les data sensitives in‑situ (poste or on‑prem) and d’envoyer au cloud seulement des data pseudonymisées, agrégées or des métadata, ce qui réduit fortement le risque de non‑conformité.[^15][^13][^8]
- Risques :
    - Architecture mal segmentée où des workloads cloud voient malgré tout des data identifiables (mauvais masquage, dérives de configuration).[^6][^10]
    - Multiplication des sous‑traitants and des régimes juridiques (cloud, sauvegarde, monitoring, CDNs), ce qui complique la gouvernance and la tenue des registres de traitement.[^15][^14]


## Table synthétique des risques

| Modèle de deployment | Risques principaux de conformité / souveraineté |
| :-- | :-- |
| Workstation | Perte/vol de poste, sync non maîtrisées, faible traçabilité. [^5][^4] |
| Server on‑prem / département | Patching/security internals, flow sortants mal documentés, load de preuve on l’organisation. [^1][^7] |
| Cloud public | Transferts transfrontaliers, lois extraterritoriales, dépendance contractuelle, mauvaise configuration client. [^2][^10][^6] |
| Architecture hybride | Complexité de gouvernance multi‑fournisseurs, risques de “leak” de data sensitives vers le cloud if la segmentation is mal faite. [^15][^8] |

Si tu veux, tu peux détailler ton secteur (ex. santé, banque, collectivité), for mapper ces risques à des textes précis (RGPD, NIS2, doctrines cloud, requirements nationales de localisation, etc.) and ajuster les patterns d’architecture and de contrats à viser.
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

