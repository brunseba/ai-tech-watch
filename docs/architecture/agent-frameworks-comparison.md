<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# quel framework pour concevoir un Agent IA

Pour concevoir un agent IA, les frameworks les plus utilisés aujourd’hui sont principalement LangGraph/LangChain, Semantic Kernel, CrewAI, AutoGen, LlamaIndex et des options managées comme OpenAI Agents ou Bedrock Agents.[^1][^2][^3]

## Frameworks code‑first (Python/TypeScript)

- LangGraph / LangChain : très adapté si tu veux des workflows agentiques explicites (graphes, nœuds, état, multi‑agents), avec un gros écosystème RAG, outils et intégrations.[^4][^5][^1]
- Semantic Kernel (Microsoft) : orienté “enterprise orchestration” avec notions de skills, planners, policies et intégration profonde Azure / M365, utile si tu es déjà très Microsoft.[^3][^4]
- CrewAI : pratique pour des “teams” d’agents avec rôles (researcher, writer, reviewer), focus sur collaboration entre agents plutôt que sur la structure du graphe.[^6][^1][^4]
- AutoGen : très bon pour multi‑agents expérimentaux et asynchrones, plutôt orienté R\&D et prototypage poussé.[^7][^1][^6]


## Frameworks visuels / low‑code

- n8n, Flowise, Make, Langflow : utiles pour composer rapidement des workflows où l’agent est un bloc parmi d’autres (APIs, files, webhooks), pratique pour intégrer dans ton SI existant sans tout recoder.[^2][^8][^9][^10]
- Plateformes d’orchestration agentique (Vellum, GenFuse, etc.) : plus orientées produit SaaS avec observabilité, évals et gouvernance intégrées si tu veux une solution clef en main plutôt qu’un framework pur.[^11][^12][^6]


## Services managés d’agents

- OpenAI Agents / Agent Builder, Amazon Bedrock Agents : conviennent si tu acceptes le lock‑in cloud et veux un service managé avec scaling, sécurité et monitoring déjà intégrés.[^11][^2][^6]


## Recommandation selon ton profil

- Pour un usage dev / plateforme interne Kubernetes, avec besoin de contrôle fort sur les graphes, la gestion d’état et l’observabilité : LangGraph (+ LangChain) est un très bon candidat.[^5][^1][^4]
- Pour du multi‑agents orienté rôles et process métier (researcher, coder, reviewer) avec code Python simple : CrewAI + éventuellement LangGraph comme orchestrateur sous‑jacent.[^1][^4][^6]
- Si ton stack est très Azure / Microsoft : Semantic Kernel pour l’orchestration, combiné à un framework multi‑agents (CrewAI, AutoGen) si nécessaire.[^4][^3]

Si tu me donnes un cas d’usage cible (ex. “agent pour tickets ITSM sur K8s avec RAG interne”), je peux te proposer un trio concret “framework agentique + orchestrateur + libs RAG” avec quelques blocs d’archi.
<span style="display:none">[^13][^14][^15][^16][^17][^18][^19][^20][^21]</span>

<div align="center">⁂</div>

[^1]: https://www.codecademy.com/article/top-ai-agent-frameworks-in-2025

[^2]: https://blog.n8n.io/ai-agent-orchestration-frameworks/

[^3]: https://www.turing.com/resources/ai-agent-frameworks

[^4]: https://servicesground.com/blog/ai-orchestration-frameworks-comparison/

[^5]: https://www.zenml.io/blog/semantic-kernel-alternatives

[^6]: https://www.multimodal.dev/post/ai-orchestration-platforms

[^7]: https://research.aimultiple.com/agentic-frameworks/

[^8]: https://www.langflow.org/blog/the-complete-guide-to-choosing-an-ai-agent-framework-in-2025

[^9]: https://www.linkedin.com/posts/daviscon_everyones-hyping-ai-agents-but-hardly-activity-7395420626301173760-vJBH

[^10]: https://blog.n8n.io/llm-agents/

[^11]: https://www.vellum.ai/blog/top-ai-agent-frameworks-for-developers

[^12]: https://genfuseai.com/blog/best-ai-agent-frameworks

[^13]: https://www.index.dev/blog/best-mcp-ai-agent-frameworks

[^14]: https://www.reddit.com/r/AI_Agents/comments/1hq9il6/best_ai_agent_frameworks_in_2025_a_comprehensive/

[^15]: https://sintra.ai/blog/best-ai-agents-in-2025-top-15-tools-platforms-frameworks

[^16]: https://pub.towardsai.net/the-ultimate-guide-to-agentic-ai-frameworks-in-2025-which-one-should-you-choose-to-build-the-a1f861f403d8

[^17]: https://www.shakudo.io/blog/top-9-ai-agent-frameworks

[^18]: https://langfuse.com/blog/2025-03-19-ai-agent-comparison

[^19]: https://akka.io/blog/agentic-ai-frameworks

[^20]: https://www.reddit.com/r/LangChain/comments/1i8ypo3/langchain_vs_crewai_vs_others_which_framework_is/

[^21]: https://botpress.com/blog/ai-agent-frameworks

