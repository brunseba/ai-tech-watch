
# Methodology for mesurer perte de precision après quantization

La bonne methodology consiste à evaluate le modèle float and le modèle quantifié in les mêmes conditions, with les mêmes métriques and le même jeu de test, puis à analyser l’écart global and par cas.[^1][^2]

## 1. Définir ce qu’on mesure

- Choose les métriques métier : accuracy, F1, mAP, BLEU/ROUGE, WER, or perplexité/score RAG for LLM, according to la tâche.[^2][^3]
- Fixer un seuil acceptable de perte (ex. ≤ 1–2 points d’accuracy, or pas de dégradation significative on tes KPI métier).[^4][^5]


## 2. Constituer jeux de test and calibration

- Jeu de test : représentatif des data réelles, suffisamment grand (et figé) for compare float vs INT8 de manière robuste.[^6][^2]
- Jeu de calibration (PTQ) : sous‑ensemble without labels (ou avec) utilisé for calibrer les activations on la target (NPU), distinct du test. Sa qualité impacte directement la perte de precision.[^7][^8][^6]


## 3. Mesurer la référence float

- Exécuter le modèle non quantifié (FP32/FP16) on le jeu de test complet.[^9][^10]
- Enregistrer :
    - Les métriques globales (accuracy, F1, etc.).
    - Optionnel : des métriques par classe / segment (types de requêtes, tailles d’entrée) for voir où ça se dégrade après quantization.[^11][^2]


## 4. Quantifier, déployer on NPU, re‑mesurer

- Appliquer la quantization INT8 (PTQ or QAT) with la toolchain du NPU (TFLite, OpenVINO, TensorRT, SDK vendor, etc.).[^12][^13][^7]
- Déployer le modèle on le NPU and exécuter EXACTEMENT le même jeu de test, with la même pipeline de pré/post‑traitement.[^2][^9]
- Calculer les mêmes métriques que for le modèle float.[^6][^2]

Perte de precision :

- $\Delta = \text{métrique}_{INT8} - \text{métrique}_{float}$ (often attendue between −1% and −5% according to tâches and qualité de la quantif).[^14][^15][^5]


## 5. Analyses complémentaires (diagnostic)

- Comparaison fine des sorties :
    - Compare outputs float vs INT8 on un échantillon (cosine similarity, MSE, PSNR on les tensors) for identifier les couches les plus sensitives.[^16][^11]
- Analyses par segment :
    - Regarder s’il y a dégradation spécifique on certaines classes, longueurs de contexte, raretés, etc., y compris on métriques RAG (exact match, nDCG).[^17][^4]


## 6. Boucle d’itération

En cas de perte trop importante :

- Ajuster la quantization : per‑channel plutôt que per‑tensor, meilleur clipping, calibration mieux représentative.[^18][^7][^4]
- Passer à des schémas hybrides : W8/A16, INT8 for couches “robustes” and FP16 for couches sensitives (embeddings, attention output).[^1][^17][^4]
- Si need, utiliser QAT for regagner une grande partie de la precision perdue.[^19][^6]

En pratique, la méthode minimale fiable is : même dataset de test, même métriques, run float → run INT8 on NPU → compare globalement and par segments métiers, puis, if nécessaire, ajouter une analyse layer‑wise (PSNR/MSE) for cibler les corrections.[^3][^11][^2]
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

