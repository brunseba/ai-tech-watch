
# Which precision modèle perd with quantization 8bit on NPU

Avec une quantization 8 bits bien faite, la plupart des models perdent très peu de precision (often < 1 point de pourcentage), même on NPU edge, à condition d'utiliser les bonnes techniques (calibration correcte, schémas adaptés au hardware) and d'evaluate on ton propre cas d'usage.[^1][^2][^3]

## Compromis Precision vs Performance

```mermaid
graph LR
    subgraph Precision ["Format de Precision"]
        FP32[FP32<br/>Baseline<br/>100% Accuracy]
        FP16[FP16<br/>~99.9% Acc<br/>2x faster]
        INT8[INT8<br/>~99% Acc<br/>4x faster]
        INT4[INT4<br/>~95-98% Acc<br/>8x faster]
    end
    
    subgraph UseCase ["Cas d'Usage"]
        U1[Médical/Légal<br/>→ FP32/FP16]
        U2[Production Générale<br/>→ INT8]
        U3[Edge Ultra-Low Power<br/>→ INT8/INT4]
    end
    
    subgraph Metrics ["Métriques"]
        M1[✅ Perte < 1%]
        M2[⚠️ Perte 1-2%]
        M3[❌ Perte > 2%]
    end
    
    FP32 -.-> U1
    FP16 -.-> U1
    INT8 -.-> U2
    INT8 -.-> U3
    INT4 -.-> U3
    
    INT8 --> M1
    INT4 --> M2
    M3 --> Recovery[QAT ou<br/>SmoothQuant]
    
    style FP32 fill:#ffebee,stroke:#e53935
    style FP16 fill:#fff3e0,stroke:#fb8c00
    style INT8 fill:#e8f5e9,stroke:#43a047
    style INT4 fill:#e3f2fd,stroke:#1e88e5
    style M1 fill:#c8e6c9
    style M2 fill:#ffe0b2
    style M3 fill:#ffcdd2
```

## Orders de grandeur typiques en INT8

- Vision / classiques (ResNet, EfficientNet, etc.) : de nombreuses études montrent des écarts de l’ordre de 0–1 point de precision top‑1 between FP32/FP16 and INT8 post‑training quantization bien calibrée.[^4][^2][^3]
- LLM and models texte : les guides récents indiquent qu’un INT8 “moderne” (LLM.int8, SmoothQuant, AWQ, etc.) perd generally < 1 point on des benchmarks globaux, sometimes quasi rien with QAT (quantization‑aware training).[^5][^6][^7][^8][^4]

Un exemple chiffré issu d’une étude pédagogique : un modèle passant de 85% à 83,5% en INT8 PTQ (≈1,5 point), alors que INT8 QAT remonte à 84,8% (écart résiduel 0,2 point).[^4]

## Specificities côté NPU edge

- La plupart des NPUs imposent INT8 statique for poids and activations, with calibration offline and toolchain propriétaire.[^9]
- Sur ces plateformes, les travaux récents montrent qu’un INT8 bien aligné with le compilateur NPU can rester in la même plage de perte qu’en GPU/CPU (often < 1–2 points), but :
    - La qualité dépend fortement de la calibration (jeu de data représentatif) and de l’algorithme de quantization choisi.[^10][^3][^9]
    - Une quantization naïve or mal calibrée can provoquer des chutes plus sévères, surtout for des models très sensitives (LLM, models with fortes valeurs extrêmes).[^7][^3][^10]

Des méthodes comme SmoothQuant, LLM.int8, Quant‑Trim or QAT are justement conçues for rendre ces INT8 robustes aux différences de backend (GPU vs NPU) and réduire la variabilité de precision.[^6][^11][^7][^9]

## Rules pratiques for estimer la perte

- Attente réaliste for du INT8 bien fait :
    - Vision / classification / détection : often 0–1 point de perte, sometimes négligeable.[^2][^4]
    - LLM / RAG : generally < 1 point on des scores agrégés, with possibilité de dérive un peu plus forte on certaines tâches fines (math, logique), d’où l’importance de tester tes propres métriques.[^12][^5][^1]
- Si tu observes > 2–3 points de perte :
    - Revoir la calibration and le schéma (per‑channel vs per‑tensor, clipping), voire envisager QAT or des schémas hybrides (W8/A16).[^8][^9][^4]

En summary, on un NPU moderne, un modèle INT8 bien quantifié garde en général une precision très proche de FP16/FP32 (often < 1% d’écart), with un gain massif en perf/watt, but il faut systématiquement valider on ton jeu de tests métier for confirmer que cette perte is acceptable.[^3][^1][^2]
<span style="display:none">[^13][^14][^15][^16][^17][^18][^19][^20]</span>

<div align="center">⁂</div>

[^1]: https://latitude-blog.ghost.io/blog/how-quantization-reduces-llm-latency/

[^2]: https://www.clarifai.com/blog/model-quantization

[^3]: https://massedcompute.com/faq-answers/?question=What+is+the+impact+of+quantization+on+the+accuracy+of+edge+AI+models%3F

[^4]: https://apxml.com/courses/practical-llm-quantization/chapter-6-evaluating-deploying-quantized-llms/accuracy-performance-tradeoffs

[^5]: https://compute.hivenet.com/post/llm-quantization-guide

[^6]: https://arxiv.org/pdf/2211.10438.pdf

[^7]: https://arxiv.org/html/2411.02530v1

[^8]: https://developer.nvidia.com/blog/optimizing-llms-for-performance-and-accuracy-with-post-training-quantization/

[^9]: https://arxiv.org/html/2511.15300v1

[^10]: https://datature.com/blog/introducing-post-training-quantization-feature-and-mechanics-explained

[^11]: https://huggingface.co/docs/bitsandbytes/reference/nn/linear8bit

[^12]: https://www.edge-ai-vision.com/2025/08/optimizing-llms-for-performance-and-accuracy-with-post-training-quantization/

[^13]: https://bentoml.com/llm/getting-started/llm-quantization

[^14]: https://milvus.io/ai-quick-reference/how-does-quantization-such-as-int8-quantization-or-using-float16-affect-the-accuracy-and-speed-of-sentence-transformer-embeddings-and-similarity-calculations

[^15]: https://www.aiacceleratorinstitute.com/how-to-8-bit-quantize-large-models-using-bits-and-bytes/

[^16]: https://www.newline.co/@zaoyang/4-bit-vs-8-bit-quantization-key-differences--842272c7

[^17]: https://www.emergentmind.com/topics/int8-quantized-training

[^18]: https://www.newline.co/@zaoyang/how-quantization-reduces-memory-in-edge-llms--6d6cb538

[^19]: https://www.linkedin.com/pulse/model-quantization-rise-edge-ai-naresh-matta-qougc

[^20]: https://docs.netspresso.ai/docs/post-training-int8-quantization

