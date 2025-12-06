
# Compare NPU GPU CPU for latency and consumption énergétique

Pour l’inference en périphérie, les CPU restent corrects but are nettement battus par les NPU en perf/watt, tandis que les GPU gardent l’avantage on le throughput for de gros models or des batchs élevés.[^1][^2][^3]

## CPU : latency correcte, conso moyenne, perf IA limitée

- Latency : très bonne on des opérations peu parallèles (dot product, logique, pré/post‑traitement), often meilleure que GPU/NPU for des petites tâches non massivement parallèles.[^2][^3]
- Consumption : modérée, but le cost énergétique par inference devient vite mauvais dès que le modèle grossit or que le volume de requêtes augmente, because le CPU n’est pas optimisé for le calcul tensoriel.[^4][^5]

À utiliser for l’orchestration, la logique métier and les petits models, but pas comme moteur principal d’inference for des networkx profonds intensifs.[^6][^4]

## GPU : latency plus élevée en batch=1, but excellent throughput

- Latency :
    - Pour batch=1, un GPU a typiquement une latency supérieure à celle d’un NPU optimisé, à cause du passage par VRAM and du pipeline plus lourd.[^1][^2]
    - Pour les gros models and les batchs plus élevés, le GPU gagne via le parallélisme de masse, with jusqu’à 22–30% de latency en moins que certains NPU on des opérations très parallèles (matmul, CNN large) and un throughput 2× plus élevé.[^3][^2]
- Consumption : élevée (des dizaines à centaines de watts), with un perf/watt moins bon que les meilleurs NPU for l’inference edge.[^7][^2][^1]

Adapté aux cas où tu veux maximiser throughput or supporter de gros models on un edge “musclé” (Jetson AGX, edge server), en acceptant une consumption plus forte.[^8][^9]

## NPU : meilleure latency unitaire and perf/watt on l’edge

- Latency :
    - Des benchmarks récents montrent que des NPU can offrir jusqu’à ~60% d’inference plus rapide que des GPU modernes on certains workloads d’inference optimisés, notamment en batch=1, grâce à la mémoire intégrée and au pipeline dédié.[^2][^1]
    - Une étude KAIST/NPU‑GPU indique ~58% de réduction de latency on certaines opérations matrices‑vecteurs vs GPU, tout en restant compétitive en throughput.[^1][^2]
- Consumption :
    - Les NPUs consomment typiquement moins de la moitié de la power d’un GPU à performance comparable (par ex. 35 W vs 75 W on une plateforme testée), soit plus de 2× de gain en energy.[^2][^1]
    - Des mesures parlent de perf ~3× meilleure en inferences/s/W on ResNet‑50 par rapport à des GPUs H‑series, and de 80% de power en moins que CPU/GPU for certains workloads IA PC.[^10][^11][^1]

Idéal for des inferences temps réel en batch=1 or faible (vision, audio, LLM quantifiés) on l’edge, with forte contrainte énergétique.[^12][^4][^2]

## Synthèse latency \& energy (tendance)

| Type | Latency batch=1 (edge) | Throughput (gros batchs) | Conso typique | Perf par watt IA |
| :-- | :-- | :-- | :-- | :-- |
| CPU | Bonne on petites ops non parallèles. [^2][^3] | Limité on CNN/LLM, pas optimisé. [^4] | 5–65 W according to plateforme. | Faible for networkx profonds. [^4][^5] |
| GPU | Plus élevée que NPU en batch=1, bonne for gros models. [^2][^1] | Excellente for gros batchs and grandes matrices, 2×+ le NPU on certains cas. [^2][^3] | 15–300+ W according to carte. | Moyenne, optimisée for perf brute plus que perf/W. [^2][^7] |
| NPU | Très basse, sometimes sub‑ms, ~60% plus rapide que GPU on certains workloads. [^2][^1] | Très bonne for batch 1–petit, correcte for moyens batchs. [^2] | Quelques W à quelques dizaines de W. [^2][^13] | Excellente : >2–3× le GPU en inferences/s/W on l’edge. [^2][^1][^10] |

En pratique, for l’inference en périphérie :

- Si tu vises perf brute and gros models : edge GPU.
- Si tu vises latency faible and perf/W maximale on des models adaptés (INT8/FP8, CNN/LLM compacts) : NPU.
- Le CPU reste la glue and can suffire for des workloads IA très modestes or en backup.[^4][^3][^2]
<span style="display:none">[^14][^15][^16][^17][^18][^19][^20][^21][^22][^23]</span>

<div align="center">⁂</div>

[^1]: https://www.servermania.com/kb/articles/npu-vs-gpu-comparison-guide

[^2]: https://arxiv.org/html/2409.14803v1

[^3]: https://arxiv.org/abs/2409.14803

[^4]: https://resources.l-p.com/knowledge-center/cpu-vs-gpu-vs-tpu-vs-npu-architecture-comparison-explained

[^5]: https://dev.to/deepakgupta/cpus-gpus-npus-and-tpus-choosing-the-right-processing-unit-for-ai-workloads-29df

[^6]: https://blog.stackademic.com/beyond-the-cpu-choosing-the-right-processing-unit-for-ai-workloads-05299ebe5f8f

[^7]: https://www.candtsolution.com/news_events-detail/NPU-vs-GPU-Which-Is-Better-for-AI/

[^8]: https://www.onlogic.com/blog/npus-vs-gpus-for-edge-ai/

[^9]: https://www.etteplan.com/about-us/insights/edge-ai-hardware-selection/

[^10]: https://creativestrategies.com/research/white-paper-the-npu-wattage-advantage/

[^11]: https://www.hp.com/th-en/shop/tech-takes/post/ai-pc-performance-benchmarks-user-types

[^12]: https://www.ibm.com/think/topics/npu-vs-gpu

[^13]: https://www.liquidweb.com/gpu/vs-npu/

[^14]: https://www.seeedstudio.com/blog/2024/08/12/cpu-vs-gpu-vs-tpu-vs-npu/

[^15]: https://par.nsf.gov/servlets/purl/10193584

[^16]: https://arxiv.org/html/2505.15622v1

[^17]: https://www.qualcomm.com/news/onq/2024/04/a-guide-to-ai-tops-and-npu-performance-metrics

[^18]: https://dtresearch.com/blog/2025/08/28/npu-101-a-guide-to-next-generation-ai-performance/

[^19]: https://brainchip.com/wp-content/uploads/2023/01/BrainChip_Benchmarking-Edge-AI-Inference-1.pdf

[^20]: https://semiengineering.com/looking-beyond-tops-w-how-to-really-compare-npu-performance/

[^21]: https://www.nature.com/articles/s41598-025-16317-6

[^22]: https://www.ijsat.org/papers/2025/2/3006.pdf

[^23]: https://www.northstarenterprisedefense.com/post/why-low-latency-artificial-intelligence-ai-inference-demands-modular-data-centers-at-the-edge

