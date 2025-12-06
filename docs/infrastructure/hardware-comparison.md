
# Compare NPU GPU CPU pour latence et consommation énergétique

Pour l’inférence en périphérie, les CPU restent corrects mais sont nettement battus par les NPU en perf/watt, tandis que les GPU gardent l’avantage sur le throughput pour de gros models ou des batchs élevés.[^1][^2][^3]

## CPU : latence correcte, conso moyenne, perf IA limitée

- Latence : très bonne sur des opérations peu parallèles (dot product, logique, pré/post‑traitement), souvent meilleure que GPU/NPU pour des petites tâches non massivement parallèles.[^2][^3]
- Consommation : modérée, mais le cost énergétique par inférence devient vite mauvais dès que le modèle grossit ou que le volume de requêtes augmente, car le CPU n’est pas optimisé pour le calcul tensoriel.[^4][^5]

À utiliser pour l’orchestration, la logique métier et les petits models, mais pas comme moteur principal d’inférence pour des réseaux profonds intensifs.[^6][^4]

## GPU : latence plus élevée en batch=1, mais excellent débit

- Latence :
    - Pour batch=1, un GPU a typiquement une latence supérieure à celle d’un NPU optimisé, à cause du passage par VRAM et du pipeline plus lourd.[^1][^2]
    - Pour les gros models et les batchs plus élevés, le GPU gagne via le parallélisme de masse, avec jusqu’à 22–30% de latence en moins que certains NPU sur des opérations très parallèles (matmul, CNN large) et un débit 2× plus élevé.[^3][^2]
- Consommation : élevée (des dizaines à centaines de watts), avec un perf/watt moins bon que les meilleurs NPU pour l’inférence edge.[^7][^2][^1]

Adapté aux cas où tu veux maximiser throughput ou supporter de gros models sur un edge “musclé” (Jetson AGX, edge server), en acceptant une consommation plus forte.[^8][^9]

## NPU : meilleure latence unitaire et perf/watt sur l’edge

- Latence :
    - Des benchmarks récents montrent que des NPU peuvent offrir jusqu’à ~60% d’inférence plus rapide que des GPU modernes sur certains workloads d’inférence optimisés, notamment en batch=1, grâce à la mémoire intégrée et au pipeline dédié.[^2][^1]
    - Une étude KAIST/NPU‑GPU indique ~58% de réduction de latence sur certaines opérations matrices‑vecteurs vs GPU, tout en restant compétitive en throughput.[^1][^2]
- Consommation :
    - Les NPUs consomment typiquement moins de la moitié de la puissance d’un GPU à performance comparable (par ex. 35 W vs 75 W sur une plateforme testée), soit plus de 2× de gain en énergie.[^2][^1]
    - Des mesures parlent de perf ~3× meilleure en inférences/s/W sur ResNet‑50 par rapport à des GPUs H‑series, et de 80% de puissance en moins que CPU/GPU pour certains workloads IA PC.[^10][^11][^1]

Idéal pour des inférences temps réel en batch=1 ou faible (vision, audio, LLM quantifiés) sur l’edge, avec forte contrainte énergétique.[^12][^4][^2]

## Synthèse latence \& énergie (tendance)

| Type | Latence batch=1 (edge) | Débit (gros batchs) | Conso typique | Perf par watt IA |
| :-- | :-- | :-- | :-- | :-- |
| CPU | Bonne sur petites ops non parallèles. [^2][^3] | Limité sur CNN/LLM, pas optimisé. [^4] | 5–65 W according to plateforme. | Faible pour réseaux profonds. [^4][^5] |
| GPU | Plus élevée que NPU en batch=1, bonne pour gros models. [^2][^1] | Excellente pour gros batchs et grandes matrices, 2×+ le NPU sur certains cas. [^2][^3] | 15–300+ W according to carte. | Moyenne, optimisée pour perf brute plus que perf/W. [^2][^7] |
| NPU | Très basse, parfois sub‑ms, ~60% plus rapide que GPU sur certains workloads. [^2][^1] | Très bonne pour batch 1–petit, correcte pour moyens batchs. [^2] | Quelques W à quelques dizaines de W. [^2][^13] | Excellente : >2–3× le GPU en inférences/s/W sur l’edge. [^2][^1][^10] |

En pratique, pour l’inférence en périphérie :

- Si tu vises perf brute et gros models : edge GPU.
- Si tu vises latence faible et perf/W maximale sur des models adaptés (INT8/FP8, CNN/LLM compacts) : NPU.
- Le CPU reste la glue et peut suffire pour des workloads IA très modestes ou en backup.[^4][^3][^2]
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

