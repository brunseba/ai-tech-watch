<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Méthodologie pour mesurer perte de précision après quantification

La bonne méthodologie consiste à évaluer le modèle float et le modèle quantifié dans les mêmes conditions, avec les mêmes métriques et le même jeu de test, puis à analyser l’écart global et par cas.[^1][^2]

## 1. Définir ce qu’on mesure

- Choisir les métriques métier : accuracy, F1, mAP, BLEU/ROUGE, WER, ou perplexité/score RAG pour LLM, selon la tâche.[^2][^3]
- Fixer un seuil acceptable de perte (ex. ≤ 1–2 points d’accuracy, ou pas de dégradation significative sur tes KPI métier).[^4][^5]


## 2. Constituer jeux de test et calibration

- Jeu de test : représentatif des données réelles, suffisamment grand (et figé) pour comparer float vs INT8 de manière robuste.[^6][^2]
- Jeu de calibration (PTQ) : sous‑ensemble sans labels (ou avec) utilisé pour calibrer les activations sur la target (NPU), distinct du test. Sa qualité impacte directement la perte de précision.[^7][^8][^6]


## 3. Mesurer la référence float

- Exécuter le modèle non quantifié (FP32/FP16) sur le jeu de test complet.[^9][^10]
- Enregistrer :
    - Les métriques globales (accuracy, F1, etc.).
    - Optionnel : des métriques par classe / segment (types de requêtes, tailles d’entrée) pour voir où ça se dégrade après quantification.[^11][^2]


## 4. Quantifier, déployer sur NPU, re‑mesurer

- Appliquer la quantification INT8 (PTQ ou QAT) avec la toolchain du NPU (TFLite, OpenVINO, TensorRT, SDK vendor, etc.).[^12][^13][^7]
- Déployer le modèle sur le NPU et exécuter EXACTEMENT le même jeu de test, avec la même pipeline de pré/post‑traitement.[^2][^9]
- Calculer les mêmes métriques que pour le modèle float.[^6][^2]

Perte de précision :

- $\Delta = \text{métrique}_{INT8} - \text{métrique}_{float}$ (souvent attendue entre −1% et −5% selon tâches et qualité de la quantif).[^14][^15][^5]


## 5. Analyses complémentaires (diagnostic)

- Comparaison fine des sorties :
    - Comparer outputs float vs INT8 sur un échantillon (cosine similarity, MSE, PSNR sur les tensors) pour identifier les couches les plus sensibles.[^16][^11]
- Analyses par segment :
    - Regarder s’il y a dégradation spécifique sur certaines classes, longueurs de contexte, raretés, etc., y compris sur métriques RAG (exact match, nDCG).[^17][^4]


## 6. Boucle d’itération

En cas de perte trop importante :

- Ajuster la quantification : per‑channel plutôt que per‑tensor, meilleur clipping, calibration mieux représentative.[^18][^7][^4]
- Passer à des schémas hybrides : W8/A16, INT8 pour couches “robustes” et FP16 pour couches sensibles (embeddings, attention output).[^1][^17][^4]
- Si besoin, utiliser QAT pour regagner une grande partie de la précision perdue.[^19][^6]

En pratique, la méthode minimale fiable est : même dataset de test, même métriques, run float → run INT8 sur NPU → comparer globalement et par segments métiers, puis, si nécessaire, ajouter une analyse layer‑wise (PSNR/MSE) pour cibler les corrections.[^3][^11][^2]
<span style="display:none">[^20][^21][^22][^23]</span>

<div align="center">⁂</div>

[^1]: https://developer.nvidia.com/blog/optimizing-llms-for-performance-and-accuracy-with-post-training-quantization/

[^2]: https://www.meegle.com/en_us/topics/quantization/quantization-evaluation

[^3]: https://apxml.com/courses/practical-llm-quantization/chapter-6-evaluating-deploying-quantized-llms/evaluating-quantized-models

[^4]: https://apxml.com/courses/practical-llm-quantization/chapter-6-evaluating-deploying-quantized-llms/accuracy-performance-tradeoffs

[^5]: https://www.clarifai.com/blog/model-quantization

[^6]: https://ml-digest.com/post-training-quantization/

[^7]: https://datature.com/blog/introducing-post-training-quantization-feature-and-mechanics-explained

[^8]: https://ai.google.dev/edge/litert/models/post_training_quantization

[^9]: https://eclipse.dev/aidge/source/Tutorial/ptq.html

[^10]: https://www.ibm.com/think/tutorials/post-training-quantization

[^11]: https://hub.embedl.com/blog/diagnosing-layer-sensitivity

[^12]: https://docs.openvino.ai/2024/openvino-workflow/model-optimization-guide/quantizing-models-post-training.html

[^13]: https://docs.netspresso.ai/docs/post-training-int8-quantization

[^14]: https://milvus.io/ai-quick-reference/how-does-quantization-such-as-int8-quantization-or-using-float16-affect-the-accuracy-and-speed-of-sentence-transformer-embeddings-and-similarity-calculations

[^15]: https://keras.io/guides/int8_quantization_in_keras/

[^16]: https://github.com/PINTO0309/onnx2tf/issues/444

[^17]: https://arxiv.org/abs/2402.18158

[^18]: https://docs.openvino.ai/2025/openvino-workflow/model-optimization-guide/quantizing-models-post-training/quantizing-with-accuracy-control.html

[^19]: https://www.runpod.io/blog/quantization-methods-speed-vs-accuracy

[^20]: https://arxiv.org/html/2507.17417v1

[^21]: https://discuss.pytorch.org/t/the-accuracy-after-int8-is-higher-than-before-quantization/87531

[^22]: https://forums.developer.nvidia.com/t/int8-yolo-model-conversion-led-to-accuracy-drop-in-deepstream/177581

[^23]: https://lightning.ai/cosmo3769/studios/post-training-quantization-to-gptq-format-and-evaluation

