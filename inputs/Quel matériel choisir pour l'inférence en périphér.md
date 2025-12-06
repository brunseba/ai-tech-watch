<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Quel matériel choisir pour l'inférence en périphérie

Le choix du matériel d’inférence en périphérie dépend surtout de la complexité du modèle, de la latence voulue, du budget énergie et du type de device (capteur, gateway, edge server).[^1][^2]

## Principaux cas de figure

- Micro‑capteurs, wearables, petits NAS :
    - Matériel : MCU ou SoC léger (ARM Cortex‑M/A avec petit NPU ou DSP).[^3][^4][^1]
    - Usage : détection simple (vibration, audio clé, petits CNN quantifiés, règles).
    - Exemples : STM32 AI, NXP i.MX RT, Renesas RA/CM, ESP32 avec accélération basique.[^4][^1]
- Gateway / box industrielle / NAS “smart” :
    - Matériel : SoC x86/ARM avec iGPU ou petit NPU / accélérateur (Intel Core Ultra avec NPU, AMD Ryzen AI, Jetson Nano/Orin Nano, Hailo, Movidius).[^5][^6][^1]
    - Usage : vision simple, RAG léger, petits LLM quantifiés, fusion multi‑capteurs, scoring temps réel.
    - Exemples : Intel OpenVINO sur Core/Atom + Movidius, NVIDIA Jetson Orin Nano, Hailo‑8/Hailo‑10, Qualcomm RBx/Snapdragon Edge.[^7][^6][^8][^1]
- Vision/robotique lourde, LLM edge puissants :
    - Matériel : modules GPU / NPU haut de gamme ou edge servers (Jetson AGX Orin, edge box avec GPU PCIe, cartes NPU haute perf).[^9][^10][^1]
    - Usage : détection temps réel multi‑caméras, robotique avancée, LLM 7–8B+ en faible latence, multiples pipelines concurrents.
    - Exemples : NVIDIA Jetson AGX Orin (jusqu’à ~275 TOPS), edge servers GPU, cartes EdgeCortix, SiMa.ai, Metis AIPU.[^10][^8][^1][^9]


## GPU vs NPU en périphérie

- GPU edge : plus flexible (vision, LLM, calcul générique), bon pour gros modèles et batchs plus importants, mais consomme davantage (15–60 W+).[^11][^12][^13]
- NPU edge : très efficace pour l’inférence (LLM quantifiés, CNN) avec latence faible et 2–3× meilleure perf/watt qu’un GPU comparable, particulièrement intéressant pour petits batchs et latence constante.[^12][^14][^15][^11]


## Grille de choix rapide

| Contrainte dominante | Matériel à privilégier | Commentaires |
| :-- | :-- | :-- |
| Ultra basse conso, capteur simple | MCU / SoC léger | Modèles tinyML, TFLite Micro, quantifiés. [^1][^4] |
| Boîtier edge polyvalent (vision légère, RAG small) | SoC CPU + NPU ou petit GPU | Intel Core Ultra, Ryzen AI, Jetson Nano/Orin Nano, Hailo. [^1][^5][^6] |
| Vision/robotique lourde, multi‑flux | Jetson AGX / edge GPU | GPU ou DPU optimisés vision. [^9][^1][^7] |
| LLM compacts en local (edge “musclé”) | NPU performant ou GPU edge | Selon perf/watt et écosystème logiciel (ONNX, TFLite, TensorRT). [^11][^16][^17] |

En pratique, partir du modèle cible (taille, quantisation), du budget puissance (W disponibles) et du facteur de forme (MCU, SBC, box, serveur edge), puis choisir dans ces familles en fonction des SDK disponibles (OpenVINO, TensorRT, TFLite, ONNX Runtime).[^6][^1][^5]
<span style="display:none">[^18][^19][^20]</span>

<div align="center">⁂</div>

[^1]: https://www.etteplan.com/about-us/insights/edge-ai-hardware-selection/

[^2]: https://dev.to/vaib/edge-ai-revolutionizing-real-time-inference-on-resource-constrained-devices-58mf

[^3]: https://www.silextechnology.com/platform-and-som-knowledge-pool/which-architecture-is-the-best-for-your-edge-ai-device

[^4]: https://www.renesas.com/en/blogs/enable-high-performance-low-power-inference-your-edge-ai-applications

[^5]: https://www.allpcb.com/fr-FR/allelectrohub/key-steps-for-edge-ai-hardware-selection-and-model-deployment

[^6]: https://snuc.eu/blog/edge-ai-hardware-software/

[^7]: https://www.onlogic.com/eu/blog/right-sizing-your-edge-ai-hardware/

[^8]: https://www.hackster.io/news/best-edge-ai-boards-summer-2025-edition-cfe8581d7460

[^9]: https://www.jaycon.com/top-10-edge-ai-hardware-for-2025/

[^10]: https://www.adlinktech.com/fr/inference_platform

[^11]: https://arxiv.org/html/2409.14803v1

[^12]: https://www.onlogic.com/blog/npus-vs-gpus-for-edge-ai/

[^13]: https://www.edgecortix.com/en/blog/what-is-edge-ai-inference-doing-for-more-devices

[^14]: https://www.servermania.com/kb/articles/npu-vs-gpu-comparison-guide

[^15]: https://www.ibm.com/think/topics/npu-vs-gpu

[^16]: https://www.siliconflow.com/articles/en/best-LLMs-for-real-time-inference-on-edge

[^17]: https://introl.com/blog/local-llm-hardware-pricing-guide-2025

[^18]: https://docs.edgeimpulse.com/nordic/concepts/edge-ai/how-to-choose-an-edge-ai-device

[^19]: https://innoria.com/blog/techtales-3/comparing-npus-and-gpus-for-edge-ai-69

[^20]: https://www.mirantis.com/blog/ai-focused-edge-inference-use-cases-and-guide-for-enterprise/

